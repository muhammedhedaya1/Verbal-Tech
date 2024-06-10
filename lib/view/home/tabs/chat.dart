import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ParentChatScreen extends StatefulWidget {
  @override
  _ParentChatScreenState createState() => _ParentChatScreenState();
}

class _ParentChatScreenState extends State<ParentChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String chatId = 'unique_chat_id'; // يجب أن يكون معرف فريد لكل محادثة
  final ScrollController _scrollController = ScrollController();

  void _sendMessage(String message) {
    if (message.trim().isEmpty) return;
    _firestore.collection('chats').doc(chatId).collection('messages').add({
      'sender': 'ولي الامر',
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
    });
    _controller.clear();
    _scrollToBottom();
  }

  void _deleteMessage(String messageId, {bool deleteForBoth = false}) {
    if (deleteForBoth) {
      _firestore.collection('chats').doc(chatId).collection('messages').doc(messageId).delete();
    } else {
      _firestore.collection('chats').doc(chatId).collection('messages').doc(messageId).update({'deletedByParent': true});
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  void _showDeleteOptions(String messageId) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0.r)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.delete_outline, color: Colors.red),
                title: Text('حذف لدي'),
                onTap: () {
                  _deleteMessage(messageId, deleteForBoth: false);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete_forever, color: Colors.red),
                title: Text('حذف لدي الطرفين'),
                onTap: () {
                  _deleteMessage(messageId, deleteForBoth: true);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle:true ,
        title: Text('مراسله الاخصائي', style: TextStyle(color: Colors.blue)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue), // لون سهم الرجوع
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0.r)), // حواف دائرية في الجزء العلوي
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/whatsapp-chat.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Expanded(
                  child: StreamBuilder(
                    stream: _firestore
                        .collection('chats')
                        .doc(chatId)
                        .collection('messages')
                        .orderBy('timestamp')
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      var messages = snapshot.data!.docs;
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (_scrollController.hasClients) {
                          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                        }
                      });
                      return ListView.builder(
                        controller: _scrollController,
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          var messageId = messages[index].id;
                          var messageData = messages[index].data() as Map<String, dynamic>;
                          var message = messageData['message'];
                          var sender = messageData['sender'];
                          var deletedByParent = messageData['deletedByParent'] ?? false;
                          var timestamp = messageData['timestamp'] as Timestamp?;
                          bool isParent = sender == 'ولي الامر';
                          var time = timestamp != null ? DateFormat('hh:mm a').format(timestamp.toDate()) : '';

                          if (deletedByParent && isParent) {
                            message = 'تم حذف الرسالة';
                          }

                          return GestureDetector(
                            onLongPress: () => _showDeleteOptions(messageId),
                            child: Container(
                              padding: EdgeInsets.all(8.0.w),
                              alignment: isParent ? Alignment.centerRight : Alignment.centerLeft,
                              child: FractionallySizedBox(
                                widthFactor: 0.7, // تحديد عرض الرسالة إلى 70% من عرض الشاشة
                                child: Card(
                                  color: isParent ? Colors.green : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0.r),
                                  ),
                                  elevation: 2.0,
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0.w),
                                    child: Column(
                                      crossAxisAlignment: isParent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          message,
                                          style: TextStyle(
                                            color: isParent ? Colors.white : Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 5.0.h),
                                        Align(
                                          alignment: isParent ? Alignment.bottomLeft : Alignment.bottomRight,
                                          child: Text(
                                            time,
                                            style: TextStyle(
                                              fontSize: 10.0.sp,
                                              color: isParent ? Colors.white70 : Colors.black54,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0.w),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          style: TextStyle(color: Colors.black), // لون النص في حقل الإدخال
                          decoration: InputDecoration(
                            labelText: 'Send a message...',
                            labelStyle: TextStyle(color: Colors.black), // لون نص التسمية
                            filled: true,
                            fillColor: Colors.white, // لون خلفية حقل النص
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0.r),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2.0.w,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0.r),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2.0.w,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0.r),
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2.0.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send, color: Colors.blue), // لون الأيقونة
                        onPressed: () => _sendMessage(_controller.text),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
