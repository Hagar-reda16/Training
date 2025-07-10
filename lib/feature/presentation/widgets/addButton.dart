import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common_ui/products.dart';
import '../manager/quantityBloc/quantity_bloc.dart';
import '../manager/cart_bloc/cart_bloc.dart';
import '../manager/cart_bloc/cart_event.dart';
import 'package:proj/service_locator.dart';

class AddButton extends StatelessWidget {
  final Product product;

  const AddButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final productId = product.productId;

    final quantityBloc = getIt<QuantityBloc>();
    final cartBloc = getIt<CartBloc>();

    return BlocBuilder<QuantityBloc, Map<int, int>>(
      bloc: quantityBloc,
      builder: (context, quantityMap) {
        final quantity = quantityMap[productId] ?? 0;

        if (quantity == 0) {
          return SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                quantityBloc.add(IncrementQuantity(productId));
                cartBloc.add(AddToCart(productId, 1));

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("1 item of ${product.name} added to cart"),
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "ADD TO CART",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          );
        } else {
          return Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    final newQuantity= quantity-1;
                    quantityBloc.add(DecrementQuantity(productId));

                        cartBloc.add(AddToCart(productId, newQuantity));

                    final message = (newQuantity == 0)
                        ? "${product.name} removed from cart"
                        : "$newQuantity item(s) of ${product.name} updated in cart";

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(message),
                    ));
                  },
                  icon: const Icon(Icons.remove, color: Colors.white),
                ),
                Text(
                  '$quantity',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    final newQuantity=quantity+1;
                    quantityBloc.add(IncrementQuantity(productId));

                        cartBloc.add(AddToCart(productId, newQuantity));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("$newQuantity item(s) of ${product.name} updated in cart"),
                    ));
                  },
                  icon: const Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
