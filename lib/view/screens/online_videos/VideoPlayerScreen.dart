import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoId;

  VideoPlayerScreen({required this.videoId});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;
  late bool isMute;
  late bool isPlaying;
  late String title, author;

  @override
  void initState() {
    super.initState();
    isMute = false;
    isPlaying = true;
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    title = "";
    author = "";
    _controller.addListener(_updateMetadata);
  }

  void _updateMetadata() {
    if (_controller.metadata.title != title || _controller.metadata.author != author) {
      setState(() {
        title = _controller.metadata.title;
        author = _controller.metadata.author;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('مشغل الفديوهات'),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            width: 400,
            color: Colors.pink,
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
            ),
          ),
          _textBuilder(title),
          _textBuilder(author, color: Colors.pink, fontSize: 25, weight: FontWeight.bold),
          _buttonRowBuilder(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isMute) {
            _controller.unMute();
          } else {
            _controller.mute();
          }
          setState(() {
            isMute = !isMute;
          });
        },
        child: isMute ? Icon(Icons.volume_off) : Icon(Icons.volume_up),
      ),
    );
  }

  Widget _textBuilder(String string, {double fontSize = 17, FontWeight weight = FontWeight.normal, Color color = Colors.black}) {
    return Container(
      margin: const EdgeInsets.all(16),
      alignment: Alignment.center,
      child: Text(
        string,
        style: TextStyle(fontSize: fontSize, fontWeight: weight, color: color),
      ),
    );
  }

  Widget _buttonRowBuilder() {
    double size = 35;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            if (_controller.value.position <= Duration(seconds: 10)) {
              _controller.seekTo(Duration(seconds: 0));
            } else {
              var p = _controller.value.position - Duration(seconds: 10);
              _controller.seekTo(p);
            }
          },
          icon: const Icon(Icons.first_page),
          iconSize: size,
        ),
        IconButton(
          onPressed: () {
            if (isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
            setState(() {
              isPlaying = !isPlaying;
            });
          },
          icon: isPlaying ? const Icon(Icons.pause) : Icon(Icons.play_arrow),
          iconSize: size,
        ),
        IconButton(
          onPressed: () {
            var newPosition = _controller.value.position + Duration(seconds: 10);
            _controller.seekTo(newPosition);
          },
          icon: const Icon(Icons.last_page),
          iconSize: size,
        ),
      ],
    );
  }
}
