import 'package:flutter/material.dart';
import 'package:contactus/contactus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: true, splitScreenMode: true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'تواصل معنا',
          style: TextStyle(color: Colors.blue, fontSize: 18.sp),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: ContactUs(
        cardColor: Colors.white,
        textColor: Colors.blue,
        logo: const AssetImage('assets/images/team.jpg'),
        email: 'mmohammedhedaya@gmail.com',
        companyName: 'Verbal Tech Team',
        companyColor: Colors.pink,
        dividerThickness: 2.h,
        phoneNumber: '+2001030019598',
        githubUserName: 'muhammedhedaya1',
        linkedinURL: 'https://www.linkedin.com/in/muhammedhedaya1/',
        tagLine: 'Graduation Project Team',
        taglineColor: Colors.blue,
        instagram: 'muhammedhedaya1',
        facebookHandle: 'muhammedhedaya',
      ),
    );
  }
}
