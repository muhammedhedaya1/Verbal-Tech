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
    if (_filePath == null) return;
    File file = File(_filePath!);

    String? audioUrl = await _uploadResponse(file);

    if (audioUrl == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل في رفع الرد')),
      );
      return;
    }

    _firestore.collection('responses').add({
      'exercise_id': widget.exerciseId,
      'audio_url': audioUrl,
      'timestamp': FieldValue.serverTimestamp(),
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم إرسال الرد بنجاح')),
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
      appBar: AppBar(
        title: Text('تسجيل رد'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: _isRecording ? _stopRecording : _startRecording,
              child: Text(_isRecording ? 'إيقاف التسجيل' : 'بدء التسجيل'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendResponse,
              child: Text('إرسال الرد'),
            ),
          ],
        ),
      ),
    );
  }
}
