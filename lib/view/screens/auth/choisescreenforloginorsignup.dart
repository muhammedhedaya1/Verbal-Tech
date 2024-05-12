import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:help_me_talk/view/screens/auth/loginfordoctor.dart';

class ChoiseScreenForLoginOrSignUp extends StatelessWidget {
  const ChoiseScreenForLoginOrSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'تسجيل دخول كــ',
          style:
              GoogleFonts.elMessiri(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogIn()),
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/Doctor.png',
                        width: 250,
                        height: 250,
                      ),
                      const Text(
                        'دكتور',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => DoctorLoginPage()),
                    // );
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/Patient.png',
                        width: 250,
                        height: 250,
                      ),
                      const Text(
                        'ولي امر',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
