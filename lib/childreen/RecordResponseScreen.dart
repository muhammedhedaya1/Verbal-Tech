import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class RecordResponseScreen extends StatefulWidget {
  final String exerciseId;

  RecordResponseScreen(this.exerciseId);

  @override
  _RecordResponseScreenState createState() => _RecordResponseScreenState();
}

class _RecordResponseScreenState extends State<RecordResponseScreen> {
  FlutterSoundRecorder? _recorder;
  bool _isRecording = false;
  String? _filePath;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _recorder = FlutterSoundRecorder();
    _initializeRecorder();
  }

  Future<void> _initializeRecorder() async {
    await _recorder!.openRecorder();
    if (await Permission.microphone.request().isGranted) {
      Directory tempDir = await getTemporaryDirectory();
      _filePath = '${tempDir.path}/response.aac';
    }
  }

  Future<void> _startRecording() async {
    await _recorder!.startRecorder(
      toFile: _filePath,
      codec: Codec.aacADTS,
    );
    setState(() {
      _isRecording = true;
    });
  }

  Future<void> _stopRecording() async {
    await _recorder!.stopRecorder();
    setState(() {
      _isRecording = false;
    });
  }

  Future<String?> _uploadResponse(File file) async {
    try {
      String fileName = 'responses/${DateTime.now().millisecondsSinceEpoch}.aac';
      TaskSnapshot snapshot = await _storage.ref(fileName).putFile(file);
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print(e);
      return null;
    }
  }

  void _sendResponse() async {
    if (_filePath == null || !File(_filePath!).existsSync()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You need to record a response before sending.')),
      );
      print('File path is null or file does not exist');
      return;
    }

    File file = File(_filePath!);

    setState(() {
      _isLoading = true;
    });

    String? audioUrl = await _uploadResponse(file);

    setState(() {
      _isLoading = false;
    });

    if (audioUrl == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل في ارسال الرد.')),
      );
      return;
    }

    _firestore.collection('responses').add({
      'exercise_id': widget.exerciseId,
      'audio_url': audioUrl,
      'timestamp': FieldValue.serverTimestamp(),
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم ارسال الرد بنجاح.')),
    );

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _recorder!.closeRecorder();
    _recorder = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.blue, // Change the back arrow color
        ),
        title: Center(child: Text('تسجيل الرد', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))),
      ),
      backgroundColor: Colors.white, // Set the background color to white
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Center(
              child: ClipOval(
                child: Image.asset(
                  'assets/images/childreenrecord.jpg',
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            if (_isRecording) ...[
              Icon(
                Icons.mic,
                size: 80,
                color: Colors.red,
              ),
              SizedBox(height: 10),
              Text('جاري التسجيل...', style: TextStyle(fontSize: 18, color: Colors.red)),
            ] else ...[
              Icon(
                Icons.mic_none,
                size: 80,
                color: Colors.black54,
              ),
              SizedBox(height: 10),
              Text('اضغط هنا لبدء التسجيل', style: TextStyle(fontSize: 18, color: Colors.black54)),
            ],
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _isRecording ? _stopRecording : _startRecording,
              icon: Icon(_isRecording ? Icons.stop : Icons.mic),
              label: Text(_isRecording ? 'ايقاف التسجيل' : 'بدء التسجيل'),
              style: ElevatedButton.styleFrom(
                backgroundColor: _isRecording ? Colors.red : Colors.blueAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _sendResponse,
              icon: _isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Icon(Icons.send),
              label: Text('ارسال الي الاخصائي'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}