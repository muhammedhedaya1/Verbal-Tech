import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:help_me_talk/view/screens/auth/loginfordoctor.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "", password = "", name = "";
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController mailcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration() async {
    if (!_formkey.currentState!.validate()) {
      return;
    }
    setState(() {
      email = mailcontroller.text;
      password = passwordcontroller.text;
      name = namecontroller.text;
    });

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "تم انشاء الحساب بنجاح",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LogIn()));
    } on FirebaseAuthException catch (e) {
      String errorMessage = "An error occurred. Please try again.";
      if (e.code == 'weak-password') {
        errorMessage = "كلمه السر ضعيفه للغايه";
      } else if (e.code == 'email-already-in-use') {
        errorMessage = "هذا الحساب مستخدم من قبل";
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            errorMessage,
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Container(
                height: 200,
                width: 200,
                child: Image.asset(
                  "assets/images/onboarding_signupdoctor.png",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFedf0f8),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Name';
                              }
                              return null;
                            },
                            controller: namecontroller,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "الاسم",
                              hintStyle: TextStyle(
                                color: Color(0xFFb2b7bf),
                                fontSize: 18.0,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0,
                                horizontal: 30.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFedf0f8),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Email';
                              }
                              return null;
                            },
                            controller: mailcontroller,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "البريد الالكتروني",
                              hintStyle: TextStyle(
                                color: Color(0xFFb2b7bf),
                                fontSize: 18.0,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0,
                                horizontal: 30.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFedf0f8),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Password';
                              }
                              return null;
                            },
                            controller: passwordcontroller,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "كلمه السر",
                              hintStyle: TextStyle(
                                color: Color(0xFFb2b7bf),
                                fontSize: 18.0,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0,
                                horizontal: 30.0,
                              ),
                            ),
                            obscureText: true,
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        GestureDetector(
                          onTap: registration,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              vertical: 13.0,
                              horizontal: 30.0,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF41C8E1),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Center(
                              child: Text(
                                "إنشاء حساب",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("هل لديك حساب بالفعل؟",
                      style: TextStyle(
                          color: Color(0xFF8c8e98),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(
                    width: 1.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LogIn()));
                    },
                    child: const Text(
                      "   سحل دخول الآن",
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
