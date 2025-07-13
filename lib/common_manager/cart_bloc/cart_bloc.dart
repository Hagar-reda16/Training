import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj/common_manager/cart_bloc/cart_event.dart';
import 'package:proj/common_manager/cart_bloc/cart_state.dart';
import 'package:proj/common_manager/shared_preferences/local_storage.dart';

import '../../common_ui/products.dart';
import 'cart_event.dart';

class CartBloc extends Bloc<CartEvent ,CartState> {
 List<Product>allProducts;
  CartBloc(this.allProducts) : super(CartState({})) {
    on<AddToCart>(_onAddToCart);
    on<LoadCart>(_onLoadCart);
    on<IncrementProduct>(_onIncrementProduct);
    on<DecrementProduct>(_onDecrementProduct);
    on<ClearCart>(_onClearCart);

  }
  int _calculateTotal(Map<int, int> items, List<Product> products) {
    int total = 0;

    for (var item in items.entries) {
      final productId = item.key;
      final quantity = item.value;

      final product = products.firstWhere((p) => p.productId == productId);
      final price = int.parse(product.price.split(' ').first);

      total += price * quantity;
    }
    return total;
  }

  Future<void> _onAddToCart(AddToCart event, Emitter<CartState> emit) async {
    final updated = Map<int, int>.from(state.cartItems);
    if (event.quantity == 0) {
      updated.remove(event.productId);
    } else {
      updated[event.productId] = event.quantity;
    }
    final total = _calculateTotal(updated, allProducts);
    emit(CartState(updated, totalPrice: total));
    await LocalStorage.saveCart(updated);
  }


  Future<void> _onLoadCart(LoadCart event, Emitter<CartState> emit) async {
    final savedCart = await LocalStorage.loadCart();
    final total = _calculateTotal(savedCart, allProducts);
    emit(CartState(savedCart, totalPrice: total));
  }

  Future<void> _onIncrementProduct(
      IncrementProduct event, Emitter<CartState> emit) async {
    final updated = Map<int, int>.from(state.cartItems);
    final currentQty = updated[event.productId] ?? 0;
    updated[event.productId] = currentQty + 1;

    final total = _calculateTotal(updated, allProducts);
    emit(CartState(updated, totalPrice: total));
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
    final total = _calculateTotal(updated, allProducts);
    emit(CartState(updated, totalPrice: total));
    await LocalStorage.saveCart(updated);
  }

 Future<void> _onClearCart(ClearCart event, Emitter<CartState> emit) async {
   final emptyCart = <int, int>{};
   emit(CartState(emptyCart , totalPrice: 0));
   await LocalStorage.saveCart({});
 }
}
