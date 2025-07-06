import 'package:flutter/material.dart';
import 'package:proj/all_products_section.dart';

import 'featured_section.dart';
import 'categories_section.dart';
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
            FeaturedSection(),
            SizedBox(
              height: 15,
            ),
            CategoriesSection(),
            SizedBox(
              height: 15,
            ),
            AllProductSection(),

          ],
        )
      ],
    );
  }
}
