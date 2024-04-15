import 'package:flutter/material.dart';
import 'package:help_me_talk/data/model/CategoryData.dart';

class CategoryItem extends StatelessWidget {
  CategoryData categoryData;
  int index;
  CategoryItem(this.categoryData,this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryData.color,
            borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(25),
      topRight: const Radius.circular(25),
      bottomLeft:index.isEven?const Radius.circular(25) :const Radius.circular(0),
      bottomRight: index.isOdd?const Radius.circular(25) :const Radius.circular(0),
      )
      ),
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Image.asset(categoryData.image!,height: 110,),
          Center(child: Text(categoryData.title!,style: const TextStyle(
            fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white,
          ),)),
        ],
      ),
    );
  }
}
