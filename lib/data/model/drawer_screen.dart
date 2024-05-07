import 'package:flutter/material.dart';
import 'package:help_me_talk/view/home/tips_screen.dart';
import 'package:share_plus/share_plus.dart';

typedef OnMenuItemClick = void Function(MenuItem clickedItemPos);




class MyDrawer extends StatelessWidget {
  final OnMenuItemClick onMenuItemClick;

  const MyDrawer({
    Key? key, required this.onMenuItemClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/defalutsplash.png',
                  height: 100,
                ),
                const Text(
                  'Help Me Talk App',
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
            ),
            title: const Text(
              'الاعدادات',
            ),
            onTap: () {
              // Navigator.pop(context);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) =>  Settings Screen()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.share,
            ),
            title: const Text(
              'شارك التطبيق',
            ),
            onTap: () {
              Share.share('''*Help Me Talk*\n
This App Develop By :Eng "Mohammed Hedaya",Mohammed Kafi,Ahmed Mahrous,Khaled Saber''');
              Navigator.pop(context);
            },
          ),ListTile(
            leading: const Icon(
              Icons.tips_and_updates,
            ),
            title: const Text(
              'ارشادات يجب اتباعها لطفلك',
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  TipsScreen()));
            },
          ),
        ],
      ),
    );
  }
}

enum MenuItem {
  categories,
  settings,
}