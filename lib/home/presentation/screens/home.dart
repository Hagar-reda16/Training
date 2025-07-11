
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj/common_manager/cart_bloc/cart_state.dart';
import 'package:proj/common_ui/product_data.dart';
import 'package:proj/common_manager/cart_bloc/cart_bloc.dart';
import 'package:proj/cart_screen/presentation/screens/cart_screen.dart';
import 'package:proj/home/presentation/screens/homebody.dart';
import 'package:proj/common_manager/getIt/service_locator.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartBloc=getIt<CartBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text("E-commerce", style: TextStyle( fontSize: 28), ),
        //centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          favouritesButton()
          ,
          BlocBuilder<CartBloc, CartState>(
            bloc: cartBloc,
            builder: (context, state) {
              int totalQuantity = state.cartItems.values.fold(0, (sum, item) => sum + item);
              return cartButton(context ,totalQuantity);
            },
          ),
        ],
      ),
      body:HomeBody(),

    );



  }

  badges.Badge cartButton(BuildContext context ,int totalQuantity) {
    return badges.Badge(
          position: badges.BadgePosition.topEnd(top: 0, end: 4),
          showBadge:totalQuantity>0 ,
          badgeStyle: badges.BadgeStyle(
           badgeColor: Colors.red ,
          ),
          badgeContent: Text("$totalQuantity", style: TextStyle(color: Colors.white),),
          child: Padding(
            padding: const EdgeInsets.only(right :8.0),
            child: IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (_)=>CartScreen(allProducts:products )));
              
            }, icon: Icon(Icons.shopping_cart),),
          ),
        );
  }

  IconButton favouritesButton() => IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline));
}

