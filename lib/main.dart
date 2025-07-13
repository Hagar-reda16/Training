import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:proj/common_ui/product_data.dart';
import 'package:proj/welcom_screen/screens/welcome_screen.dart';
import 'package:proj/common_manager/getIt/service_locator.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<Map>('catBox');
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

