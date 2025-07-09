import 'package:flutter/material.dart';
import 'package:proj/feature/presentation/screens/product_detais.dart';
import 'package:proj/common_ui/products.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.products,
  required this.index
    // required this.product,
    ,super.key});

    // final Product product;
  final List <Product> products;
  final int index;
  @override
  Widget build(BuildContext context) {
    final product=products[index];
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=> ProductDetais(products: products, index: index)));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            imageBuild(product),
            Padding(padding: EdgeInsets.all(8) ,
              child: Text(product.name),),
            Padding(padding: EdgeInsets.all(8) ,
              child: Text(product.price),),
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
