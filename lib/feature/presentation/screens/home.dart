
import 'package:flutter/material.dart';
import 'package:proj/feature/presentation/widgets/homebody.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-commerce", style: TextStyle( fontSize: 28), ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body:HomeBody(),

    );



  }
}
