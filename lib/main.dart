import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:proj/common_ui/product_data.dart';
import 'package:proj/home/presentation/screens/home.dart';
import 'package:proj/welcom_screen/screens/welcome_screen.dart';
import 'package:proj/common_manager/getIt/service_locator.dart';

import 'common_manager/cart_bloc/cart_bloc.dart';
import 'common_manager/cart_bloc/cart_event.dart';
import 'package:dio/dio.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  setupLocator();
  getIt<CartBloc>().add(LoadCart());
  getNews();
  runApp( ECommerce());

}
final dio=Dio();
void getNews() async{
  final response = await dio.get("https://newsapi.org/v2/everything?q=sports&sortBy=popularity&apiKey=c7163abba9224fd3b1786fc40018a371");
  print(response);
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

