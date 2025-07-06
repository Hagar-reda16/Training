import 'package:flutter/material.dart';
import 'package:proj/product_detais.dart';
import 'package:proj/products.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.product,super.key});
final Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=> ProductDetais(product: product)));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                child: Image.asset(product.imgproduct ,
                  fit: BoxFit.cover,),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Padding(padding: EdgeInsets.all(7) ,
              child: Text(product.name),),
            Padding(padding: EdgeInsets.all(7) ,
              child: Text(product.price),),
          ],
        ),
      ),
    );
  }
}
