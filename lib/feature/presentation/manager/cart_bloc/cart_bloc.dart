import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj/feature/presentation/manager/cart_bloc/cart_event.dart';


class CartBloc extends Bloc<CartEvent ,Map<int,int>>{

  CartBloc() : super({}) {
  on<AddToCart>((event, emit) {
  final updated = Map<int, int>.from(state);
  if (event.quantity == 0) {
    updated.remove(event.productId);
  } else {
    updated[event.productId] = event.quantity;
  }
  emit(updated);
  });
  }
}