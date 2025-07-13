import 'package:flutter/material.dart';
import 'package:proj/common_ui/product_data.dart';
import 'package:proj/welcom_screen/screens/welcome_screen.dart';
import 'package:proj/common_manager/getIt/service_locator.dart';


void main(){
  setupLocator(products);
  runApp( ECommerce());

}

class ECommerce extends StatelessWidget {
  const ECommerce({super.key});

  @override
  Widget build(BuildContext context) {

     return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:WelcomeScreen(),
    );
  }
}

