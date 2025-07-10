
import 'package:flutter/material.dart';
import 'package:proj/feature/presentation/screens/home.dart';
import 'package:proj/feature/presentation/screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:proj/feature/presentation/manager/product_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj/feature/presentation/manager/quantityBloc/quantity_bloc.dart';

import 'feature/presentation/manager/cart_bloc/cart_bloc.dart';

void main(){
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => QuantityBloc()),
        BlocProvider(create: (_) => CartBloc()), // <-- here
      ],
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

