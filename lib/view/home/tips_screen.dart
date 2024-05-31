import 'package:flutter/material.dart';
import 'package:help_me_talk/data/model/tips_model.dart';
import 'package:help_me_talk/view/home/tips_details.dart';

class TipsScreen extends StatelessWidget {
  final List<String> someTips = const [
    "النصيحه الاولي",
    "النصيحه الثانيه",
    "النصيحه الثالثه",
    "النصيحه الرابعه",
    "النصيحه الخامسه",
    "النصيحه السادسه",
    "النصيحه السابعه",
    "النصيحه الثامنه",
    "النصيحه التاسعه",
    "النصيحه العاشره",
    "النصيحه الحاديه عشر",
    "النصيحه الثانيه عشر",
    "النصيحه الثالثه عشر",
    "النصيحه الرابعه عشر",
    "النصيحه الخامسه عشر",
    "النصيحه السادسه عشر",
    "النصيحه السابعه عشر",
    "النصيحه الثامنه عشر",
    "النصيحه التاسعه عشر",
    "النصيحه العشرون",
    "النصيحه الواحد والعشرون",
  ];

  TipsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,        iconTheme: IconThemeData(color: Colors.blue), // لون سهم الرجوع

        title: Text(
          "نصائح",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipOval(
              child: Image.asset(
                "assets/images/tips_screen.jpg",
                height: 180,
                width: 180,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              separatorBuilder: (context, index) => Divider(
                thickness: 1,
                color: Colors.blue,
                endIndent: 10,
                indent: 10,
              ),
              itemCount: someTips.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TipsDetails(
                          arguments: TipsModel(someTips[index], index),
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      someTips[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
