import 'package:flutter/material.dart';
import 'package:help_me_talk/view/home/tabs/main_screen.dart';
import 'package:help_me_talk/view/home/tabs/process.dart';
import 'package:help_me_talk/view/home/tabs/profile.dart';
import 'package:help_me_talk/view/home/tabs/reports.dart';

class HomeScreen extends StatefulWidget {


  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    const MainScreen(),
    TasksTab(),
    const ReportsScreen(),
     ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Verbal Tech',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
      // drawer: MyDrawer(
      //   onMenuItemClick: (clickedItemPos) {},
      // ),
      body: tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/proccesing.png'),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/increase.png'),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/profilepage.png'),
            ),
            label: "",
          ),
        ],
      ),
    );
  }

}
