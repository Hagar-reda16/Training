import 'package:flutter/material.dart';
import 'package:proj/feature/presentation/widgets/all_products_section.dart';

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
          padding: EdgeInsets.all(8),
          children: [
            FeaturedSection(),
            SizedBox(
              height: 16,
            ),
            CategoriesSection(),
            SizedBox(
              height: 16,
            ),
            AllProductSection(),

          ],
        )
      ],
    );
  }
}
