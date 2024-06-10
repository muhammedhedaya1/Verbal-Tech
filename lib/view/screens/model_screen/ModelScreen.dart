import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceRecognitionScreen extends StatefulWidget {
  @override
  _VoiceRecognitionScreenState createState() => _VoiceRecognitionScreenState();
}

class _VoiceRecognitionScreenState extends State<VoiceRecognitionScreen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = '';
  final Map<String, String> _wordToImage = {
    'احمر': 'assets/images/red.jpg',
    'اوطه': 'assets/images/tomato.jpg',
    'بابا': 'assets/images/father.avif',
    'موز': 'assets/images/banana.jpg',
    'مياه': 'assets/images/water.jpg',
    'يد': 'assets/images/hand.jpg',
  };

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (_wordToImage.containsKey(_text)) {
              _showImageDialog(_wordToImage[_text]!);
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  void _showImageDialog(String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(backgroundColor: Colors.white,
          content: Image.asset(imagePath),
          actions: <Widget>[
            TextButton(
              child: Text('اغلاق'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(360, 800), minTextAdapt: true, splitScreenMode: true);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: true,
        title: Text('التعرف على الأصوات', style: TextStyle(color: Colors.blue, fontSize: 20.sp)),
        iconTheme: IconThemeData(color: Colors.blue), // تغيير لون سهم الرجوع
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipOval(
              child: Image.asset(
                'assets/images/0__wn_aijeudpW4ogG.jpg',
                height: 230.h,
                width: 230.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              _text,
              style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(height: 20.h),
            FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: _listen,
              child: Icon(
                _isListening ? Icons.mic : Icons.mic_none,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}