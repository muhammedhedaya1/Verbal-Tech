import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:help_me_talk/view/screens/auth/signupfordoctor.dart';

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
          const SizedBox(
            height: 70.0,
          ),
          Container(
            alignment: Alignment.topCenter,
            child: const Text(
              "إعادة تعيين كلمة المرور",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            "من فضلك ادخل البريد الالكتروني",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Image.asset("assets/images/check email.png"),
          Expanded(
            child: Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يجب ادخال البريد الإلكتروني';
                          }
                          return null;
                        },
                        controller: mailcontroller,
                        style: const TextStyle(color: Colors.blue),
                        decoration: const InputDecoration(
                            hintStyle:
                                TextStyle(fontSize: 18.0, color: Colors.blue),
                            suffixIcon: Icon(
                              Icons.email,
                              color: Colors.blue,
                              size: 30.0,
                            ),
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
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
                        width: 150,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50)),
                        child: const Center(
                          child: Text(
                            "افحص البريد الخاص بك",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "ليس لديك حساب؟",
                          style: TextStyle(fontSize: 18.0, color: Colors.blue),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()));
                          },
                          child: const Text(
                            "   قم بإنشاء حساب الآن",
                            style: TextStyle(
                                color: Colors.pink,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
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
