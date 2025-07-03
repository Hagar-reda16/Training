import 'package:flutter/material.dart';
class Category extends StatelessWidget {
  final String? imgpath;
  const Category({ required this.imgpath});

  //@overrid
  Widget build(BuildContext context) {
    return Container
      (
      color:Colors.transparent,
      // to take the same color of the parent
     // color: Colors.green,
      width: 200,
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child:Image.asset(imgpath! ,fit: BoxFit.cover ),
      ),
    );
  }
}
