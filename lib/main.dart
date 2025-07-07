
import 'package:flutter/material.dart';
import 'package:proj/home.dart';
import 'package:proj/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:proj/product_provider.dart';


void main(){
  runApp(ChangeNotifierProvider(
      create: (context)=>ProductProvider(),
      child: ECommerce()));
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

