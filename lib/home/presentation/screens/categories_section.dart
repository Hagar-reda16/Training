import 'package:flutter/material.dart';

import '../widgets/categories.dart';
import '../../../common_ui/constant.dart';
class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
       const Text("Categories :", style: TextStyle( fontSize: 24),),
       const SizedBox(height: 4,),
      items(),
    ],);
  }








  SingleChildScrollView items() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(

        children: [
          Category(imgpath: "D:/proj/assets/pics/foundation.jpeg"),
          wSizedBox,
          Category(imgpath: "D:/proj/assets/pics/lipgloss.jpg"),
          wSizedBox,
          Category(imgpath: "D:/proj/assets/pics/eyeshadow.jpg"),
          wSizedBox,
          Category(imgpath: "D:/proj/assets/pics/eyeliner.jpg"),
          wSizedBox,
        ],
      ),

    );
  }}