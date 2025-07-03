import 'package:flutter/material.dart';
import 'package:proj/p3.dart';

import 'p1.dart';
import 'p2.dart';
class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
        ListView(
          padding: EdgeInsets.all(7),
          children: [
            Part1(),
            SizedBox(
              height: 15,
            ),
            Part2(),
            SizedBox(
              height: 15,
            ),
            Part3(),

          ],
        )
      ],
    );
  }
}
