import 'package:flutter/material.dart';

import 'categories.dart';
import 'constant.dart';
class Part2 extends StatelessWidget {
  const Part2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
       const Text("Categories", style: TextStyle( fontSize: 25),),
       const SizedBox(height: 5,),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(

          children: [
            Category(imgpath: "D:/proj/assets/pics/foundation.jpeg"),
            wSizedBox,
            Category(imgpath: "D:/proj/assets/pics/eyeshadow.jpg"),
            wSizedBox,
            Category(imgpath: "D:/proj/assets/pics/lipgloss.jpg"),
            wSizedBox,
            Category(imgpath: "D:/proj/assets/pics/eyeliner.jpg"),
            wSizedBox,
          ],
        ),

      ),
    ],);}}