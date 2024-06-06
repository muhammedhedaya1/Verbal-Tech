import 'package:flutter/material.dart';
import 'package:help_me_talk/view/screens/online_videos/VideoPlayerScreen.dart';

class VideoGridView extends StatelessWidget {
  final Map<String, String> videoMap = {
    'الدرس الأول': 'https://www.youtube.com/watch?v=6no0I-oEMBQ&list=PLCG8_cIPPm2QUY1hj2x2r5MO5a6HzR0u0&index=11',
    'الدرس الثاني': 'https://www.youtube.com/watch?v=8Lq1KlLvNfQ&list=PLCG8_cIPPm2QUY1hj2x2r5MO5a6HzR0u0&index=2',
    'الدرس الثالث': 'https://www.youtube.com/watch?v=xH26Ct4v1KU&list=PLCG8_cIPPm2QUY1hj2x2r5MO5a6HzR0u0&index=3',
    'الدرس الرابع': 'https://www.youtube.com/watch?v=DbBW1Qrjt3c&list=PLCG8_cIPPm2QUY1hj2x2r5MO5a6HzR0u0&index=4',
    'الدرس الخامس': 'https://www.youtube.com/watch?v=HVWCOCV0qyA&list=PLCG8_cIPPm2QUY1hj2x2r5MO5a6HzR0u0&index=7',
    'الدرس السادس': 'https://www.youtube.com/watch?v=1lXvS3HcMIk&list=PLCG8_cIPPm2QUY1hj2x2r5MO5a6HzR0u0&index=10',
    'الدرس السابع': 'https://www.youtube.com/watch?v=4fLiTfFyKI0&list=PLCG8_cIPPm2QUY1hj2x2r5MO5a6HzR0u0&index=15',
    'الدرس الثامن': 'https://www.youtube.com/watch?v=XNTgOQLm-Fo&list=PLCG8_cIPPm2QUY1hj2x2r5MO5a6HzR0u0&index=14',
    'الدرس التاسع': 'https://www.youtube.com/watch?v=3_A5HPaUkls&list=PLCG8_cIPPm2QUY1hj2x2r5MO5a6HzR0u0&index=16',
    'الدرس العاشر': 'https://www.youtube.com/watch?v=alSaBy0s9rw&list=PLCG8_cIPPm2QUY1hj2x2r5MO5a6HzR0u0&index=12',
    'الدرس الحادي عشر': 'https://www.youtube.com/watch?v=HXc-lM3h4V4&list=PLCG8_cIPPm2QUY1hj2x2r5MO5a6HzR0u0&index=9',
    'الدرس الثاني عشر': 'https://www.youtube.com/watch?v=fIJErFFihfo&list=PLCG8_cIPPm2QUY1hj2x2r5MO5a6HzR0u0&index=8',
    'الدرس الثالت عشر': 'https://www.youtube.com/watch?v=4u8hJUY7i_w&list=PLCG8_cIPPm2QUY1hj2x2r5MO5a6HzR0u0&index=6',
    'الدرس الرابع عشر': 'https://www.youtube.com/watch?v=5z4B_DJoaRw&list=PLCG8_cIPPm2QUY1hj2x2r5MO5a6HzR0u0&index=13',
    'الدرس الخامس عشر': 'https://www.youtube.com/watch?v=kVMB70ph6wE',
    'الدرس السادس عشر': 'https://www.youtube.com/watch?v=jki58cmBBww&list=PLysH4LrUgI5kMDPyd7CwP0szBTpb-Oe1n&index=1',
    'الدرس السابع عشر': 'https://www.youtube.com/watch?v=K-4meWmQVO0&list=PLysH4LrUgI5kMDPyd7CwP0szBTpb-Oe1n&index=2',
    'الدرس الثامن عشر': 'https://www.youtube.com/watch?v=WlGBk4cpTws&list=PLysH4LrUgI5kMDPyd7CwP0szBTpb-Oe1n&index=3',
    'الدرس التاسع عشر': 'https://www.youtube.com/watch?v=v1IHmD0_sJY&list=PLysH4LrUgI5kMDPyd7CwP0szBTpb-Oe1n&index=4',
    'الدرس العشرين': 'https://www.youtube.com/watch?v=wDVpixYqHhY&list=PLysH4LrUgI5kMDPyd7CwP0szBTpb-Oe1n&index=5',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('فيديوهات لطفلك', style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 16 / 9,
          crossAxisCount: 2,
        ),
        itemCount: videoMap.length,
        itemBuilder: (context, index) {
          final title = videoMap.keys.elementAt(index);
          final videoId = videoMap.values.elementAt(index);
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoPlayerScreen(videoId: videoId),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.blue, width: 2.0),
              ),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(color: Colors.pink, fontSize: 20),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


