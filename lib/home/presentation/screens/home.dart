
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proj/common_manager/cart_bloc/cart_state.dart';
import 'package:proj/common_ui/product_data.dart';
import 'package:proj/common_manager/cart_bloc/cart_bloc.dart';
import 'package:proj/cart_screen/presentation/screens/cart_screen.dart';
import 'package:proj/home/presentation/screens/homebody.dart';
import 'package:proj/common_manager/getIt/service_locator.dart';
import 'package:proj/home/presentation/widgets/home_nav_bar.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
   // final cartBloc=getIt<CartBloc>();
    return Scaffold(
      appBar:PreferredSize(
    preferredSize: const Size.fromHeight(72),
    child: AppBar(
      backgroundColor: Color(0xFFFFFFFF),
      elevation: 0,
      //automaticallyImplyLeading: false,
      leading: Padding(
        padding: const EdgeInsets.only(left:24),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search, color: Color(0xFF2F3036), size: 20),
        ),
      ),
      centerTitle: true,
      title: SizedBox(
        width: 70.23,
        height: 35.46,
        child: Image.asset(
          "assets/pics/Frame 2.png",
          fit: BoxFit.contain,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right:24),
          // child: SizedBox(
          //   width: 64,
          //   height: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border, size: 24,color: Color(0xFF1F2024)),
                ),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_outlined, size: 24,color: Color(0xFF1F2024)),

                ),
              ],
            ),
          ),
        //),
      ],
    ),
        ),

        body: HomeNavBar(),
    );



  }}









//   badges.Badge cartButton(BuildContext context ,int totalQuantity) {
//     return badges.Badge(
//           position: badges.BadgePosition.topEnd(top: 0, end: 4),
//           showBadge:totalQuantity>0 ,
//           badgeStyle: badges.BadgeStyle(
//            badgeColor: Colors.red ,
//           ),
//           badgeContent: Text("$totalQuantity", style: TextStyle(color: Colors.white),),
//           child: Padding(
//             padding: const EdgeInsets.only(right :8.0),
//             child: IconButton(onPressed: (){
//               Navigator.push(context, MaterialPageRoute(
//                   builder: (_)=>CartScreen(allProducts:products )));
//
//             }, icon: Icon(Icons.shopping_cart),),
//           ),
//         );
//   }
//
//   IconButton favouritesButton() => IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline));
// }

