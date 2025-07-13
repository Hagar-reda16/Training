import 'package:flutter_bloc/flutter_bloc.dart';


abstract class QuantityEvent {}

class IncrementQuantity extends QuantityEvent {
  final int productId;
  IncrementQuantity(this.productId);
}

class DecrementQuantity extends QuantityEvent {
  final int productId;
  DecrementQuantity(this.productId);
}

class SetQuantity extends QuantityEvent {
  final int productId;
  final int quantity;
  SetQuantity(this.productId, this.quantity);
}

class UpdateQuantity extends QuantityEvent {
  final int productId;
  final int newQuantity;

  UpdateQuantity(this.productId, this.newQuantity);
}
class ResetAllQuantities extends QuantityEvent {}
class ClearAllQuantities extends QuantityEvent {}


class QuantityBloc extends Bloc<QuantityEvent, Map<int,int>> {
  QuantityBloc() : super({}) {
    on<IncrementQuantity>((event, emit) {
      final updated = Map<int, int>.from(state);
      updated[event.productId] = (updated[event.productId] ?? 0) + 1;
      emit(updated);
    });

    on<DecrementQuantity>((event, emit) {
      final updated = Map<int, int>.from(state);
      final current = updated[event.productId] ?? 0;
      if (current > 1) {updated[event.productId] = current - 1;}
      else {
        updated.remove(event.productId);
      }
      emit(updated);
    });



    on<UpdateQuantity>((event, emit) {
      final updated = Map<int, int>.from(state);
      if (event.newQuantity == 0) {
        updated.remove(event.productId);
      } else {
        updated[event.productId] = event.newQuantity;
      }
      emit(updated);
    });

    on<ResetAllQuantities>((event, emit) {
      emit({});
    });
    on<ClearAllQuantities>((event, emit) {
      emit({});
    });
  }
}
