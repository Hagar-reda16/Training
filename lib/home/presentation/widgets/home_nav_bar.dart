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
  //final CartBloc cartBloc = getIt<CartBloc>();

  final List<Widget> _screens = [
     HomeBody(),
    const Center(child: Text("Favourites", style: TextStyle(fontSize: 24))),
    const Center(child: Text("Categories", style: TextStyle(fontSize: 24))),
   /// CartScreen(allProducts: products),
    const Profile(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: _screens[_currentIndex],
   bottomNavigationBar:  Container(
     height: 88,
     width: double.infinity,
     padding: EdgeInsets.fromLTRB(16, 16, 16, 32), //8=>16 //2=>16
     color: Color(0xFFFFFFFF),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: buildNavItem(index: 0, icon: Icons.explore, label: "Explore")),
          Expanded(child: buildNavItem(index: 1, icon: Icons.search, label: "Search")),
          Expanded(child: buildNavItem(index: 2, icon: Icons.grid_view_rounded, label: "Categories")),
          Expanded(child: buildNavItem(index: 3, icon: Icons.person_outline, label: "Profile")),
        ],
      )

   )

    );
  }
  Widget buildNavItem({required int index, required IconData icon, required String label}) {
    final bool isSelected = index == _currentIndex;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
            color: isSelected ? const Color(0xFF0019FF) : const Color(0xFFD4D6DD),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 12,
            child: Text(
              label,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                fontSize: 10,
                letterSpacing:isSelected?0:0.015,
                height: isSelected?1.0:1.4,
                color: isSelected ? const Color(0xFF1F2024) : const Color(0xFF71727A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

  // BottomNavigationBarItem buildBottomNavigationBarCartItem() {
  //   return BottomNavigationBarItem(
  //       icon: BlocBuilder<CartBloc, CartState>(
  //         bloc: cartBloc,
  //         builder: (context, state) {
  //           int totalQuantity =
  //               state.totalQuantity;
  //
  //           return badges.Badge(
  //             showBadge: totalQuantity > 0,
  //             position: badges.BadgePosition.topEnd(top: -12, end: -12),
  //             badgeContent: Text(
  //               '$totalQuantity',
  //               style: const TextStyle(color: Colors.white, fontSize: 12),
  //             ),
  //             child: const Icon(Icons.shopping_cart),
  //           );
  //         },
  //       ),
  //       label: 'Cart',
  //     );
  // }

