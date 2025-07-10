import 'package:get_it/get_it.dart';
import 'package:proj/feature/presentation/manager/cart_bloc/cart_bloc.dart';
import 'package:proj/feature/presentation/manager/quantityBloc/quantity_bloc.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<CartBloc>(() => CartBloc());
  getIt.registerLazySingleton<QuantityBloc>(() => QuantityBloc());
}