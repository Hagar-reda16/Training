import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj/feature/presentation/manager/quantityBloc/quantity_bloc.dart';
import 'package:proj/feature/presentation/screens/product_detais.dart';
import 'package:proj/common_ui/products.dart';
import 'package:proj/feature/presentation/widgets/add_to_cart_button.dart';
import 'package:proj/feature/presentation/widgets/counter.dart';

import '../manager/cart_bloc/cart_bloc.dart';
import '../manager/cart_bloc/cart_event.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.products,
  required this.index

    ,super.key});

    // final Product product;
  final List <Product> products;
  final int index;
  @override
  Widget build(BuildContext context) {
    final product=products[index];
    final productId=product.productId;
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(
                builder: (_) => ProductDetais(products: products, index: index),
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
            BlocBuilder<QuantityBloc, Map<int, int>>(
              builder: (context, quantityMap) {
                final product = products[index];
                final productId = product.productId;
                final quantity = quantityMap[productId] ?? 0;
                final bloc = context.read<QuantityBloc>();

                return Column(
                  children: [
                    Counter(bloc: bloc, productId: productId, quantity: quantity),
                    AddToCartButton(product: product),
                  ],

                );
              })],

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
