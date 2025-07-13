
class CartState {
  final Map<int, int> cartItems;
  final int totalPrice;
  CartState(this.cartItems, {int?totalPrice}):totalPrice=totalPrice??0;
}