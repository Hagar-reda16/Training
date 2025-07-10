import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj/common_ui/products.dart';
import '../manager/cart_bloc/cart_bloc.dart';
import '../manager/cart_bloc/cart_event.dart';
import '../manager/quantityBloc/quantity_bloc.dart';
import 'package:proj/service_locator.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({required this.allProducts});
  final List<Product> allProducts;
  @override
  Widget build(BuildContext context) {

    final cartBloc = getIt<CartBloc>();
    final quantityBloc = getIt<QuantityBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
      ),
      body: BlocBuilder<CartBloc,Map<int,int>>
        ( bloc: cartBloc,
        builder: ( context, cartMap) {
          if(cartMap.isEmpty){
            return const Center(
              child:Text("Your Cart Is EMPTY 🛒 " , style: TextStyle(fontSize: 28),),
            );
          }
          final cartItems=allProducts.where((product)=>cartMap.containsKey(product.productId)).toList();
           return ListView.builder(
               itemCount: cartItems.length,
               itemBuilder: (context,index){
                 final product=cartItems[index];
                 final quantity=cartMap[product.productId] ??0;

                 return  finalProductCard(product, quantity, context , quantityBloc ,cartBloc);

               });
          
      },

    ),

    );
  }

  Card finalProductCard(Product product, int quantity, BuildContext context ,QuantityBloc quantityBloc ,CartBloc cartBloc) {
    return Card(
                 margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                 child: Padding(
                   padding: const EdgeInsets.all(8),
                   child: Row(
                     children: [
                       Image.asset(product.imgproduct, width: 60, height: 60),
                       const SizedBox(width: 12),
                       Expanded(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
                             const SizedBox(height: 4),
                             Text("Total: ${calculateTotalPrice(product.price, quantity)} LE"),
                             const SizedBox(height: 4),
                             Row(
                               children: [
                                 IconButton(
                                   onPressed: () {
                                     final updatedQty = quantity - 1;
                                     cartBloc.add(
                                         AddToCart(product.productId, updatedQty));
                                     quantityBloc.add(
                                         UpdateQuantity(product.productId, updatedQty));
                                   },
                                   icon: Icon(Icons.remove),
                                 ),
                                 Text(quantity.toString()),
                                 IconButton(
                                   onPressed: () {
                                     final updatedQty = quantity + 1;
                                     cartBloc.add(
                                         AddToCart(product.productId, updatedQty));
                                     quantityBloc.add(
                                         UpdateQuantity(product.productId, updatedQty));
                                   },
                                   icon: Icon(Icons.add),
                                 ),
                               ],
                             ),
                           ],
                         ),
                       ),
                       IconButton(
                         icon: Icon(Icons.delete),
                         onPressed: () {
                           cartBloc.add(
                               AddToCart(product.productId, 0));
                           quantityBloc.add(
                               UpdateQuantity(product.productId, 0));
                         },
                       ),
                     ],
                   ),
                 ),
               );
  }
  String calculateTotalPrice(String priceInText, int quantity) {

    final numericPrice = int.tryParse(priceInText.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
    final total = numericPrice * quantity;
    return total.toString();
  }
}
