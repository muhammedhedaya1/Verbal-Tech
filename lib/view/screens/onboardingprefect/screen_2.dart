
import 'package:flutter/material.dart';
import 'package:help_me_talk/view/screens/onboardingprefect/components/slanding_clipper.dart';
import 'package:help_me_talk/view/screens/onboardingprefect/screen_Three.dart';

import '../constantforonboarding/constants.dart';

class OnboardingScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotatedBox(
                quarterTurns: 2,
                child: ClipPath(
                  clipper: SlandingClipper(),
                  child: Container(
                    height: size.height * 0.4,
                    color: Color(0xFF229EE1),
                  ),
                ),
              ),
              Image(
                width: size.width,
                height: size.height * 0.5,
                image: AssetImage('assets/images/onboardingtwo.png'),
              ),
            ],
          ),
          Positioned(
            top: size.height * 0.05,
            child: Container(
              width: size.width,
              padding: EdgeInsets.all(appPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'محاضرات اونلاين',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: white,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    'راقب عواطفك بسهولة يوميًا. افهم مشاعرك، وتحكم في صحتك العقلية',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: appPadding / 4),
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      border: Border.all(color: black, width: 2),
                      shape: BoxShape.circle,
                      color: white),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: appPadding / 4),
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      border: Border.all(color: black, width: 2),
                      shape: BoxShape.circle,
                      color: yellow),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: appPadding / 4),
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      border: Border.all(color: black, width: 2),
                      shape: BoxShape.circle,
                      color: white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => OnboardingScreenThree(),
                    ),
                  );
                },
                backgroundColor: white,
                child: Icon(
                  Icons.navigate_next_rounded,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}