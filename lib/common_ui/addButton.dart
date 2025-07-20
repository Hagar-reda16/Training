import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj/common_manager/cart_bloc/cart_state.dart';
import 'package:proj/data/models/product_model.dart';
import '../common_manager/cart_bloc/cart_event.dart';
import 'products.dart';
import '../common_manager/quantity_bloc/quantity_bloc.dart';
import 'package:proj/common_manager/getIt/service_locator.dart';
import 'package:proj/common_manager/cart_bloc/cart_bloc.dart';

class AddButton extends StatelessWidget {
  final ProductModel product;

  const AddButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final productId = product.id;
    //final quantityBloc = getIt<QuantityBloc>();
    final cartBloc = getIt<CartBloc>();

    return BlocBuilder<CartBloc, CartState>(
      bloc: cartBloc,
      builder: (context, cartState) {
        final quantity = cartState.cartItems[productId] ?? 0;

        if (quantity == 0) {
          return buildButton(cartBloc, productId);
        } else {
          return buildContainer(cartBloc, quantity, productId);
        }
      },
    );
  }



  Widget buildContainer(CartBloc cartBloc, int quantity, int productId) {
    return Container(
          height: 48,
          decoration: BoxDecoration(
            color: Color(0xFF0019FF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {

                  cartBloc.add(DecrementProduct(productId));

                },
                icon: const Icon(Icons.remove, color: Colors.white),
              ),
              Text(
                '$quantity',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              IconButton(
                onPressed: () {

                  cartBloc.add(IncrementProduct(productId));

                },
                icon: const Icon(Icons.add, color: Colors.white),
              ),
            ],
          ),
        );
  }

  Widget buildButton(CartBloc cartBloc, int productId) {
    return SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              cartBloc.add(IncrementProduct(productId));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF0019FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "+  Add to cart",
              style: TextStyle(fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFF8F8F8),
              fontFamily: 'Inter'),
            ),
          ),
        );
  }
}
