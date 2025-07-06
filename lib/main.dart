
import 'package:flutter/material.dart';
import 'package:proj/home.dart';
import 'package:proj/welcome_screen.dart';

void main(){
  runApp(const ECommerce());
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

