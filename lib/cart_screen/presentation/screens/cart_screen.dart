import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj/common_manager/cart_bloc/cart_state.dart';
import 'package:proj/common_ui/products.dart';
import 'package:proj/data/models/product_model.dart';
import '../../../common_manager/cart_bloc/cart_bloc.dart';
import '../../../common_manager/cart_bloc/cart_event.dart';
import '../../../common_manager/quantity_bloc/quantity_bloc.dart';
import 'package:proj/common_manager/getIt/service_locator.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({required this.allProducts});
  final List<ProductModel> allProducts;
  @override
  Widget build(BuildContext context) {

    final cartBloc = getIt<CartBloc>();
    final quantityBloc = getIt<QuantityBloc>();

    return Scaffold(
      appBar: AppBar(),

      body: BlocBuilder<CartBloc,CartState>
        ( bloc: cartBloc,
        builder: ( context, state) {
          if(state.cartItems.isEmpty){
            return const Center(
              child:Text("Your Cart Is EMPTY 🛒 " , style: TextStyle(fontSize: 28),),
            );
          }
          final cartItems=allProducts.where((product)=>state.cartItems.containsKey(product.id)).toList();
           return Column(
             children: [
               Expanded(
                 child: ListView.builder(
                     padding: const EdgeInsets.only(bottom: 16),
                     itemCount: cartItems.length,
                     itemBuilder: (context,index){
                       final product=cartItems[index];
                       final quantity=state.cartItems[product.id] ??0;

                       return  finalProductCard(product, quantity, context , quantityBloc ,cartBloc);

                     }),
               ),
               const Divider(thickness: 1.5),

               bottomSection(state, cartBloc, quantityBloc, context),
             ],
           );
        },
      ),
    );
  }




  Padding bottomSection(CartState state, CartBloc cartBloc, QuantityBloc quantityBloc, BuildContext context) {
    return Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
               child: Column(
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       const Text("Total:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                       Text("${state.totalPrice} LE", style: const TextStyle(fontSize: 18)),
                     ],
                   ),
                   const SizedBox(height: 12),
                   Row(
                     children: [
                       Expanded(
                         child: ElevatedButton.icon(
                           onPressed: () {
                             cartBloc.add(const ClearCart());
                             quantityBloc.add(ResetAllQuantities());
                           },
                           icon: const Icon(Icons.delete_forever),
                           label: const Text("Clear Cart"),
                           style: ElevatedButton.styleFrom(
                             backgroundColor: Colors.red,
                           ),
                         ),
                       ),
                       const SizedBox(width: 10),
                       Expanded(
                         child: ElevatedButton.icon(
                           onPressed: () {
                             ScaffoldMessenger.of(context).showSnackBar(
                               const SnackBar(content: Text("Proceeding to checkout...")),
                             );
                           },
                           icon: const Icon(Icons.payment),
                           label: const Text("Checkout"),
                           style: ElevatedButton.styleFrom(
                             backgroundColor: Colors.green,
                           ),
                         ),
                       ),
                     ],
                   ),
                 ],
               ),
             );
  }


  Card finalProductCard(ProductModel product, int quantity, BuildContext context ,QuantityBloc quantityBloc ,CartBloc cartBloc) {
    return Card(
                 margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                 child: Padding(
                   padding: const EdgeInsets.all(8),
                   child: Row(
                     children: [
                       Image.asset(product.images.first, width: 60, height: 60),
                       const SizedBox(width: 12),
                       Expanded(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(product.title, style: TextStyle(fontWeight: FontWeight.bold)),
                             const SizedBox(height: 4),
                             Text("Total: ${calculateTotalPrice(product.price, quantity)} LE"),
                             const SizedBox(height: 4),
                             Row(
                               children: [
                                 IconButton(
                                   onPressed: () {
                                    cartBloc.add(DecrementProduct(product.id));
                                   },
                                   icon: Icon(Icons.remove),
                                 ),
                                 Text(quantity.toString()),
                                 IconButton(
                                   onPressed: () {
                                     cartBloc.add(IncrementProduct(product.id));
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
                               AddToCart(product.id, 0));
                           quantityBloc.add(
                               UpdateQuantity(product.id, 0));
                         },
                       ),
                     ],
                   ),
                 ),
               );
  }
  String calculateTotalPrice(int price, int quantity) {

    //final numericPrice = int.tryParse(priceInText.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
    final total = price * quantity;
    return total.toString();
  }
}
