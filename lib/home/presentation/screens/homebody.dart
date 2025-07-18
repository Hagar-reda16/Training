import 'package:flutter/material.dart';
import 'package:proj/home/presentation/screens/all_products_section.dart';

import 'featured_section.dart';
import 'categories_section.dart';
class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FeaturedSection(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal:16 ,vertical:24 ),
               child: Column(
              children: [
                AllProductSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
