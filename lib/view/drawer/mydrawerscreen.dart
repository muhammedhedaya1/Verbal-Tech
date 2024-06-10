import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_me_talk/view/drawer/ContactUsScreen.dart';
import 'package:help_me_talk/view/drawer/PrivacyPolicyScreen.dart';
import 'package:help_me_talk/view/screens/auth/loginforparent.dart';

class MyDrawerScreen extends StatelessWidget {
  const MyDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(360, 800), minTextAdapt: true, splitScreenMode: true);

    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.all(50.w),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white, // Background color for drawer header
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 1.h), // Adjust the top padding to move the image down
                child: Image.asset(
                  'assets/images/اخصائية-تخاطب.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.policy),
              title: Text(
                'سياسة الخصوصية',
                style: TextStyle(fontSize: 16.sp),
              ),
              tileColor: Colors.blue,
              textColor: Colors.black,
              iconColor: Colors.blue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_phone),
              title: Text(
                'اتصل بنا',
                style: TextStyle(fontSize: 16.sp),
              ),
              tileColor: Colors.blue,
              textColor: Colors.black,
              iconColor: Colors.blue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactUsScreen()),
                );
              },
            ),ListTile(
              leading: Icon(Icons.logout_rounded),
              title: Text(
                'تسجيل الخروج',
                style: TextStyle(fontSize: 16.sp),
              ),
              tileColor: Colors.blue,
              textColor: Colors.black,
              iconColor: Colors.blue,
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginForParent(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
