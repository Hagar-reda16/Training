import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj/feature/presentation/manager/cart_bloc/cart_event.dart';
import 'package:proj/local_storage.dart';

class CartBloc extends Bloc<CartEvent ,Map<int,int>>{

  CartBloc() : super({}) {

    on<AddToCart>(_onAddToCart);
    on<LoadCart>(_onLoadCart);

  }

  Future<void> _onAddToCart(AddToCart event, Emitter<Map<int, int>> emit) async {
    final updated = Map<int, int>.from(state);
    if (event.quantity == 0) {
      updated.remove(event.productId);
    } else {
      updated[event.productId] = event.quantity;
    }
    emit(updated);
    await LocalStorage.saveCart(updated);
  }


  Future<void> _onLoadCart(LoadCart event, Emitter<Map<int, int>> emit) async {
    final savedCart = await LocalStorage.loadCart();
    emit(savedCart);}


}