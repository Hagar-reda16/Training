import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common_ui/products.dart';
import '../manager/cart_bloc/cart_bloc.dart';
import '../manager/cart_bloc/cart_event.dart';
import '../manager/quantityBloc/quantity_bloc.dart';

class AddToCartButton extends StatelessWidget {

  final Product product;

  const AddToCartButton({
    super.key,
    required this.product,

  });



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52 ,
      width:double.infinity,
      child: Padding(
        padding: EdgeInsets.only(left: 16,right: 16),
        child: ElevatedButton(
          onPressed: (){
            final productId=product.productId;
            final quantity = context
                .read<QuantityBloc>().state[productId] ?? 0;
            context.read<CartBloc>().add(AddToCart(productId, quantity));

            final message = (quantity == 0)
                ? "${product.name} removed from cart"
                : "$quantity item(s) of ${product.name} added to cart";
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );


          },
          child: Text("ADD TO CART " , style: TextStyle(color:Colors.white , fontSize: 20),),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              backgroundColor: Color(0xFFB39DDB)
          ),
        ),
      ),
    );
  }
}