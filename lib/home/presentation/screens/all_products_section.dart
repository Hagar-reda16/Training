import 'package:flutter/material.dart';
import 'package:proj/common_ui/products.dart';
import 'package:proj/home/presentation/widgets/product_card.dart';
import 'package:proj/data/models/product_model.dart';
import 'package:proj/data/services/product_service.dart';

class AllProductSection extends StatelessWidget {
  AllProductSection({super.key});

  final Future<List<ProductModel>> _futureProducts = ProductService()
      .fetchProducts();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "All Products",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See more",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Color(0xFF0019FF),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Product list
        FutureBuilder<List<ProductModel>>(
          future: _futureProducts,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Expanded(
                child: Center(child: CircularProgressIndicator()),
              );
            }

            if (snapshot.hasError) {
              return Expanded(
                child: Center(child: Text("Error: ${snapshot.error}")),
              );
            }

            final products = snapshot.data!;

            // return ProductCard(
            //   product: ProductModel(
            //     id: 1,
            //     title: "pants",
            //     description: "vvxhgvxhvxtxvqwhkhswhihwbx",
            //     price: 123,
            //     images: ["hhxvsxax"],
            //     categoryName: "afcgxsxsyx",
            //   ),
            // );

            return SizedBox(
              height:189,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                physics: const BouncingScrollPhysics(),
                itemCount: products.length,
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
