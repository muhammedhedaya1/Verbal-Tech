import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:help_me_talk/view/drawer/mydrawerscreen.dart';
import 'package:help_me_talk/view/home/tabs/AddChildScreen.dart';
import 'package:help_me_talk/view/home/tabs/main_screen.dart';
import 'package:help_me_talk/view/home/tabs/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    MainScreen(),
    AddChildScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Verbal Tech',
          style: TextStyle(color: Colors.pink, fontSize: 18.sp), // Adjust font size using ScreenUtil
        ),
      ),
      drawer: MyDrawerScreen(),
      body: tabs[selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        backgroundColor:  Color(0xFFABE1E0),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: <Widget>[
          Icon(Icons.home, size: 25.sp, color: Colors.blue),
          Icon(Icons.child_care, size: 25.sp, color: Colors.blue),
          Icon(Icons.person, size: 25.sp, color: Colors.blue),
        ],
      ),
    );
  }
}
