import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj/common_manager/cart_bloc/cart_event.dart';
import 'package:proj/common_manager/cart_bloc/cart_state.dart';
import 'package:proj/common_manager/shared_preferences/local_storage.dart';

import 'cart_event.dart';

class CartBloc extends Bloc<CartEvent ,CartState> {

  CartBloc() : super(CartState({})) {
    on<AddToCart>(_onAddToCart);
    on<LoadCart>(_onLoadCart);
    on<IncrementProduct>(_onIncrementProduct);
    on<DecrementProduct>(_onDecrementProduct);

  }

  Future<void> _onAddToCart(AddToCart event, Emitter<CartState> emit) async {
    final updated = Map<int, int>.from(state.cartItems);
    if (event.quantity == 0) {
      updated.remove(event.productId);
    } else {
      updated[event.productId] = event.quantity;
    }
    emit(CartState(updated));
    await LocalStorage.saveCart(updated);
  }


  Future<void> _onLoadCart(LoadCart event, Emitter<CartState> emit) async {
    final savedCart = await LocalStorage.loadCart();
    emit(CartState(savedCart));
  }

  Future<void> _onIncrementProduct(
      IncrementProduct event, Emitter<CartState> emit) async {
    final updated = Map<int, int>.from(state.cartItems);
    final currentQty = updated[event.productId] ?? 0;
    updated[event.productId] = currentQty + 1;
    emit(CartState(updated));
    await LocalStorage.saveCart(updated);
  }
  Future<void> _onDecrementProduct(
      DecrementProduct event, Emitter<CartState> emit) async {
    final updated = Map<int, int>.from(state.cartItems);
    final currentQty = updated[event.productId] ?? 0;
    final newQty = currentQty > 1 ? currentQty - 1 : 0;

    if (newQty == 0) {
      updated.remove(event.productId);
    } else {
      updated[event.productId] = newQty;
    }

    emit(CartState(updated));
    await LocalStorage.saveCart(updated);
  }
}
