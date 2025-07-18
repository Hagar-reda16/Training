import 'package:flutter/material.dart';
import 'package:proj/common_ui/constant.dart';
import 'package:proj/product_details/presentation/screens/product_detais.dart';
import 'package:proj/common_ui/products.dart';
import 'package:proj/common_ui/addButton.dart';

import '../../../data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.product, super.key});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetails(productId: product.id),
          ),
        );
      },
      child: Container(
        height: 195,
        width: 200,
        decoration: BoxDecoration(
          color: const Color(0xFFF8F9FE),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  product.images.first,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF1F2024),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${product.price}',
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1F2024),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
