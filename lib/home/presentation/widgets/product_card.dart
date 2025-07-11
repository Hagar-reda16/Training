import 'package:flutter/material.dart';
import 'package:proj/product_details/presentation/screens/product_detais.dart';
import 'package:proj/common_ui/products.dart';
import 'package:proj/common_ui/addButton.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.products,
  required this.index

    ,super.key});

  final List <Product> products;
  final int index;
  @override
  Widget build(BuildContext context) {
    final product=products[index];
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(
                builder: (_) => ProductDetais(
                    products: products, index: index),
        ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imageBuild(product),
            SizedBox(height: 8,),
            Text(product.name , style: TextStyle(fontWeight:FontWeight.bold),),
            SizedBox(height: 8,),
            Text(product.price , style: TextStyle(fontWeight:FontWeight.bold),),
            SizedBox(height: 8,),

            AddButton(product: product),

      ],

        ),

      ),
    );
  }

  Expanded imageBuild(Product product) {
    return Expanded(
            child: ClipRRect(
              child: Image.asset(product.imgproduct ,
                fit: BoxFit.cover,),
              borderRadius: BorderRadius.circular(12),
            ),
          );
  }
}
