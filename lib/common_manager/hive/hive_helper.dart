import 'package:hive/hive.dart';

class HiveHelper {
  static const String _boxName = 'cartBox';
  static const String _cartKey = 'cart';


  static Future<void> saveCart(Map<int, int> cartItems) async {
    final box = await Hive.openBox(_boxName);
    final converted = cartItems.map((key, value) => MapEntry(key.toString(), value));
    await box.put(_cartKey, converted);
  }


  static Future<Map<int, int>> loadCart() async {
    final box = await Hive.openBox(_boxName);
    final loaded = box.get(_cartKey);
    if (loaded == null) return {};

    return Map<String, dynamic>.from(loaded).map((key, value) =>
        MapEntry(int.parse(key), value as int));
  }

  static Future<void> clearCart() async {
    final box = await Hive.openBox(_boxName);
    await box.delete(_cartKey);
  }
}
