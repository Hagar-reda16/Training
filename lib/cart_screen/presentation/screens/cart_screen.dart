import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj/common_manager/cart_bloc/cart_state.dart';
import 'package:proj/common_ui/products.dart';
import '../../../common_manager/cart_bloc/cart_bloc.dart';
import '../../../common_manager/cart_bloc/cart_event.dart';
import '../../../common_manager/quantity_bloc/quantity_bloc.dart';
import 'package:proj/common_manager/getIt/service_locator.dart';

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
      body: BlocBuilder<CartBloc,CartState>
        ( bloc: cartBloc,
        builder: ( context, state) {
          if(state.cartItems.isEmpty){
            return const Center(
              child:Text("Your Cart Is EMPTY 🛒 " , style: TextStyle(fontSize: 28),),
            );
          }
          final cartItems=allProducts.where((product)=>state.cartItems.containsKey(product.productId)).toList();
           return ListView.builder(
               itemCount: cartItems.length,
               itemBuilder: (context,index){
                 final product=cartItems[index];
                 final quantity=state.cartItems[product.productId] ??0;

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
                                    cartBloc.add(DecrementProduct(product.productId));
                                   },
                                   icon: Icon(Icons.remove),
                                 ),
                                 Text(quantity.toString()),
                                 IconButton(
                                   onPressed: () {
                                     cartBloc.add(IncrementProduct(product.productId));
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
