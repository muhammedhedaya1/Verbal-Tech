import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:help_me_talk/data/model/exercise_model/tips_model.dart';

class TipsDetails extends StatefulWidget {
  final TipsModel arguments;

  TipsDetails({Key? key, required this.arguments}) : super(key: key);

  @override
  State<TipsDetails> createState() => _TipsDetailsState();
}

class _TipsDetailsState extends State<TipsDetails> with SingleTickerProviderStateMixin {
  List<String> verses = [];
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    // Load the file when the page is initialized
    loadFile(widget.arguments.index);

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
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
        backgroundColor: Colors.blue,
        title: Text(
          ' ${widget.arguments.name}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // Setting the back arrow color to white
        ),
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Opacity(
            opacity: _opacityAnimation.value,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  itemCount: verses.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(25),
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.blue)
                      ),
                      color: Colors.white,
                      elevation: 3,
                      child: Text(
                        verses[index],
                        style: TextStyle(fontSize: 25, color: Colors.blue),
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Method to load the file content into verses list
  void loadFile(int index) async {
    String tips =
    await rootBundle.loadString("assets/files/${widget.arguments.index +1}.txt");
    List<String> lines = tips.split("\n");
    setState(() {
      verses = lines;
    });
  }
}
