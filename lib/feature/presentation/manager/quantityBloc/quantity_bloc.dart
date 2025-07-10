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

    on<SetQuantity>((event, emit) {
      final updated = Map<int, int>.from(state);
      updated[event.productId] = event.quantity;
      emit(updated);
    });
  }
}
