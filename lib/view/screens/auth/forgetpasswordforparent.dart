import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:help_me_talk/view/screens/auth/signupforparent.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String email = "";
  TextEditingController mailcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "تم إرسال رسالة إعادة تعيين كلمة المرور!",
          style: TextStyle(fontSize: 20.0),
        ),
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "هذا البريد الإلكتروني غير مسجل. من فضلك تأكد من البريد الإلكتروني المدخل.",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "حدث خطأ ما. الرجاء المحاولة مرة أخرى لاحقًا.",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 70.h),
          Container(
            alignment: Alignment.topCenter,
            child: Text(
              "إعادة تعيين كلمة المرور",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "من فضلك ادخل البريد الالكتروني",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.h),
          SvgPicture.asset("assets/images/check email.svg"),
          Expanded(
            child: Form(
              key: _formkey,
              child: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10.w),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2.w),
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يجب ادخال البريد الإلكتروني';
                          }
                          return null;
                        },
                        controller: mailcontroller,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 18.sp, color: Colors.black),
                          suffixIcon: Icon(
                            Icons.email,
                            color: Colors.blue,
                            size: 30.sp,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 40.h),
                    GestureDetector(
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            email = mailcontroller.text;
                          });
                          resetPassword();
                        }
                      },
                      child: Container(
                        width: 150.w,
                        padding: EdgeInsets.all(15.h),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Center(
                          child: Text(
                            "افحص البريد الخاص بك",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ليس لديك حساب؟",
                          style: TextStyle(fontSize: 18.sp, color: Colors.blue),
                        ),
                        SizedBox(width: 5.w),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const SignUp()),
                            );
                          },
                          child: Text(
                            "   قم بإنشاء حساب الآن",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
