import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:help_me_talk/view/home/category.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
              items: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    // Border color and width
                    borderRadius:
                    BorderRadius.circular(5), // Border radius if needed
                  ),
                  child: Image.asset('assets/images/carousel_slider1.jpg'),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    // Border color and width
                    borderRadius:
                    BorderRadius.circular(5), // Border radius if needed
                  ),
                  child: Image.asset('assets/images/carousel_slider2.jpg'),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    // Border color and width
                    borderRadius:
                    BorderRadius.circular(5), // Border radius if needed
                  ),
                  child: Image.asset('assets/images/carousel_slider3.jpg'),
                ),
              ],
              options: CarouselOptions(
                height: 160,
                viewportFraction: 0.8,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 900),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
        CategoryForHomeScreen(),
      ],
    );
  }
}
