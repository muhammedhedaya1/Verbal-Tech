// import 'package:flutter/material.dart';
// import 'package:help_me_talk/view/home/categories/category.dart';
//
// class CategoryItem extends StatelessWidget {
//   Category category;
//   int index;
//   CategoryItem(this.category,this.index, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: category.color,
//             borderRadius: BorderRadius.only(
//           topLeft: const Radius.circular(25),
//       topRight: const Radius.circular(25),
//       bottomLeft:index.isEven?const Radius.circular(25) :const Radius.circular(0),
//       bottomRight: index.isOdd?const Radius.circular(25) :const Radius.circular(0),
//       )
//       ),
//       child: Column(
//         mainAxisAlignment:MainAxisAlignment.spaceEvenly,
//         children: [
//           Image.asset(category.image!,height: 100,),
//           Center(child: Text(category.title!,style: const TextStyle(
//             fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,
//           ),)),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:help_me_talk/view/home/categories/category.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  int index;

  CategoryItem(this.category, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
          bottomRight: Radius.circular(index.isEven?0 :24),
          bottomLeft:Radius.circular(index.isEven?24 :0) ,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('${category.image!}',
            height: 120,
            width: double.infinity,
            fit: BoxFit.fitHeight,
          ),
          Text(
            category.title!,
            style: TextStyle(fontSize: 22, color: Colors.white),
          )
        ],
      ),
    );
  }
}