import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
 import 'service_locator.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void setupLocator() => getIt.init();














// import 'package:proj/common_manager/cart_bloc/cart_bloc.dart';
// import 'package:proj/common_manager/cart_bloc/cart_event.dart';
// import 'package:proj/common_manager/quantity_bloc/quantity_bloc.dart';
// import 'package:proj/common_ui/products.dart';
// import 'package:get_it/get_it.dart';
//
// import 'package:injectable/injectable.dart';
//
//
// final getIt = GetIt.instance;
// @InjectableInit()
// //void setupLocator() =>getIt.init();
//
//
//
// // void setupLocator(List<Product>allProducts) {
// //   getIt.registerLazySingleton<QuantityBloc>(() => QuantityBloc());
// //   getIt.registerLazySingleton<CartBloc>(() {
// //     final cartBloc = CartBloc(allProducts);
// //     cartBloc.add(LoadCart());
// //     return cartBloc;
// //   });}