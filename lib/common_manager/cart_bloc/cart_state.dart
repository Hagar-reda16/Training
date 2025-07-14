
class CartState {
  final Map<int, int> cartItems;
  final int totalPrice;
  final int totalQuantity;
  CartState(
      Map<int, int>? cartItems, {
        int? totalPrice,
        int? totalQuantity,
      })  : cartItems = cartItems ?? {},
        totalPrice = totalPrice ?? 0,
        totalQuantity = totalQuantity ?? (cartItems ?? {}).values.fold(0, (sum, item) => sum + item);
}