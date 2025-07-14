import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj/common_manager/cart_bloc/cart_state.dart';
import 'package:proj/profile/presentations/screens/profile.dart';

import '../../../cart_screen/presentation/screens/cart_screen.dart';
import '../../../common_manager/cart_bloc/cart_bloc.dart';
import '../../../common_manager/getIt/service_locator.dart';
import '../../../common_ui/product_data.dart';
import '../screens/homebody.dart';
class HomeNavBar extends StatefulWidget {
  const HomeNavBar({super.key});

  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {

  int _currentIndex = 0;
  final CartBloc cartBloc = getIt<CartBloc>();

  final List<Widget> _screens = [
    const HomeBody(),
    const Center(child: Text("Favourites", style: TextStyle(fontSize: 24))),
    CartScreen(allProducts: products),

    Profile(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: _screens[_currentIndex],
   bottomNavigationBar:  BottomNavigationBar(
     type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: (index){
        setState(() {
          _currentIndex=index;
        });
      },
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home),
        label: 'Home',
        ),
        const BottomNavigationBarItem(icon: Icon(Icons.favorite_outline),
          label: 'Favourites',
        ),
        BottomNavigationBarItem(
          icon: BlocBuilder<CartBloc, CartState>(
            bloc: cartBloc,
            builder: (context, state) {
              int totalQuantity =
                  state.totalQuantity;

              return badges.Badge(
                showBadge: totalQuantity > 0,
                position: badges.BadgePosition.topEnd(top: -12, end: -12),
                badgeContent: Text(
                  '$totalQuantity',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                child: const Icon(Icons.shopping_cart),
              );
            },
          ),
          label: 'Cart',
        ),
        const BottomNavigationBarItem(icon: Icon(Icons.person),
          label: 'Profile',
        ),



      ],

    )

    );
  }
}
