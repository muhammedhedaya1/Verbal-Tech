import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

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

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Parent Chat', style: TextStyle(color: Colors.blue))),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue), // لون سهم الرجوع
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)), // حواف دائرية في الجزء العلوي
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
                          var message = messages[index]['message'];
                          var sender = messages[index]['sender'];
                          var timestamp = messages[index]['timestamp'] as Timestamp?;
                          bool isParent = sender == 'ولي الامر';
                          var time = timestamp != null
                              ? DateFormat('hh:mm a').format(timestamp.toDate())
                              : '';
                          return Container(
                            padding: EdgeInsets.all(8.0),
                            alignment: isParent ? Alignment.centerRight : Alignment.centerLeft,
                            child: Container(
                              decoration: BoxDecoration(
                                color: isParent ? Colors.green : Colors.grey[300],
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: isParent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    message,
                                    style: TextStyle(
                                      color: isParent ? Colors.white : Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 5.0),
                                  Text(
                                    time,
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      color: isParent ? Colors.white70 : Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2.0,
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
