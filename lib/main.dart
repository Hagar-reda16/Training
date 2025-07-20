import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:proj/home/presentation/screens/home.dart';
import 'package:proj/common_manager/getIt/service_locator.dart';
import 'common_manager/cart_bloc/cart_bloc.dart';
import 'common_manager/cart_bloc/cart_event.dart';
import 'data/models/product_model.dart';
import 'data/services/product_service.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  setupLocator();
  final productService = getIt<ProductService>();
  final List<ProductModel> products = await productService.fetchProducts();

  getIt.unregister<List<ProductModel>>(instanceName: 'allProducts');
  getIt.registerSingleton<List<ProductModel>>(products, instanceName: 'allProducts');

  getIt<CartBloc>().add(LoadCart());
  runApp( ECommerce());

}

class ECommerce extends StatelessWidget {
  const ECommerce({super.key});

  @override
  Widget build(BuildContext context) {

     return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    );
  }
}

