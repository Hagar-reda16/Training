import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
class LocalStorage{
  static const String _cartKey ="cart_items";

  static Future <void> saveCart(Map<int,int> cart) async
  {
    final prefs=await SharedPreferences.getInstance();

    final jsonString = jsonEncode(cart);
    await prefs.setString((_cartKey), jsonString);

  }

 static Future <Map<int,int>> loadCart() async{
    final prefs =await SharedPreferences.getInstance();

    final jsonString=prefs.getString(_cartKey);
    if(jsonString==null){
      return {};}

    final decoded=jsonDecode(jsonString);
    return Map<int,int>.from(decoded);


 }

 static Future <void> clearCart() async{
    final prefs=await SharedPreferences.getInstance();
    await prefs.remove(_cartKey);
 }
}
