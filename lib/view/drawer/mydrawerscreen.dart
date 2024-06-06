import 'package:flutter/material.dart';
import 'package:help_me_talk/view/drawer/ContactUsScreen.dart';
import 'package:help_me_talk/view/drawer/PrivacyPolicyScreen.dart';

class MyDrawerScreen extends StatelessWidget {
  const MyDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.all(50),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white, // Background color for drawer header
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 1.0), // Adjust the top padding to move the image down
                child: Image.asset(
                  'assets/images/اخصائية-تخاطب.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.policy),
              title: Text('سياسة الخصوصية'),tileColor: Colors.blue,
              textColor: Colors.black,
              iconColor: Colors.blue,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyPolicyScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_phone),
              title: Text('اتصل بنا'),tileColor: Colors.blue,
              textColor: Colors.black,
              iconColor: Colors.blue,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactUsScreen()));

              },
            ),
          ],
        ),
      ),
    );
  }
}
