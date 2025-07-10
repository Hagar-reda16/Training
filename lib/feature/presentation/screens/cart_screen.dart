import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj/common_ui/products.dart';

import '../manager/cart_bloc/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({required this.allProducts});
  final List<Product> allProducts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
      ),
      body: BlocBuilder<CartBloc,Map<int,int>>
        (builder: ( context, cartMap) {
          if(cartMap.isEmpty){
            return Center(
              child:Text("Your Cart Is EMPTY 🛒 " , style: TextStyle(fontSize: 28),),
            );
          }
          final cartItems=allProducts.where((product)=>cartMap.containsKey(product.productId)).toList();
           return ListView.builder(
               itemCount: cartItems.length,
               itemBuilder: (context,index){

                 final product=cartItems[index];
                 final quantity=cartMap[product.productId] ??0;

                 return ListTile(
                   leading: Image.asset(product.imgproduct ,width: 48,),
                   title: Text(product.name),
                   subtitle: Text("Quantity : $quantity"),
                   trailing: Text(
                     "${calculateTotalPrice(product.price, quantity)} ",
                     style: TextStyle(fontWeight: FontWeight.bold),
                   ),
                 );

               });
          
      },

    ),

    );
  }
  String calculateTotalPrice(String priceInText, int quantity) {

    final numericPrice = int.tryParse(priceInText.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
    final total = numericPrice * quantity;
    return total.toString();
  }
}
