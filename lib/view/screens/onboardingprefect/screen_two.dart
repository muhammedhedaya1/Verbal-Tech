import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:help_me_talk/view/screens/onboardingprefect/components/slanding_clipper.dart';
import 'package:help_me_talk/view/screens/onboardingprefect/screen_three.dart';
import '../constantforonboarding/constants.dart';

class OnboardingScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for responsive design
    ScreenUtil.init(context, designSize: Size(360, 700), minTextAdapt: true, splitScreenMode: true);

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
                    height: 0.4.sh, // 40% of screen height
                    color: Color(0xFF229EE1),
                  ),
                ),
              ),
              SizedBox(
                width: 0.8.sw, // 80% of screen width
                height: 0.5.sh, // 50% of screen height
                child: SvgPicture.asset(
                  'assets/images/on boarding two.svg',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          Positioned(
            top: 0.05.sh, // 5% of screen height from top
            child: Container(
              width: 1.sw, // 100% of screen width
              padding: EdgeInsets.all(appPadding.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'محاضرات اونلاين',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: white,
                      fontSize: 30.sp, // Responsive font size
                    ),
                  ),
                  SizedBox(
                    height: 0.02.sh, // 2% of screen height
                  ),
                  Text(
                    'راقب عواطفك بسهولة يوميًا. افهم مشاعرك، وتحكم في صحتك العقلية',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp, // Responsive font size
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 15.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: appPadding / 4.w),
                  width: 15.w,
                  height: 15.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: black, width: 2.w),
                      shape: BoxShape.circle,
                      color: white),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: appPadding / 4.w),
                  width: 15.w,
                  height: 15.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: black, width: 2.w),
                      shape: BoxShape.circle,
                      color: yellow),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: appPadding / 4.w),
                  width: 15.w,
                  height: 15.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: black, width: 2.w),
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
                  size: 30.sp, // Responsive icon size
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
