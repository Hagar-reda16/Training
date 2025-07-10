import 'package:flutter/material.dart';

import '../manager/quantityBloc/quantity_bloc.dart';


class Counter extends StatelessWidget {
  const Counter({
    super.key,
    required this.bloc,
    required this.productId,
    required this.quantity,
  });

  final QuantityBloc bloc;
  final int productId;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed:(){ bloc.add(DecrementQuantity(productId));},
            icon: Icon(Icons.remove)),
        Text(quantity.toString() , style: TextStyle(fontSize: 20),),
        IconButton(onPressed: (){bloc.add(IncrementQuantity(productId));},
            icon: Icon(Icons.add))
      ],
    );
  }
}