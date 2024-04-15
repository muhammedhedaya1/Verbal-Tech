import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExerciseItem extends StatelessWidget {
  const ExerciseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(color: Colors.white,
      elevation: 12,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blue)),
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 80,
              width: 4,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            Column(
              children: [
                Text(
                  "التمرين الاول",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                Text(
                  "ماذا افعل",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12,vertical: 3
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12)
              ),
             child:Icon(Icons.done,color: Colors.white,),
            ),
          ],
        ),
      ),
    );
  }
}
