import 'package:flutter/material.dart';
import 'package:proj/feature/presentation/screens/welcome_screen.dart';
import 'package:proj/service_locator.dart';


void main(){
  setupLocator();
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

