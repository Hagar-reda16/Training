

abstract class CartEvent {
  const CartEvent();
}
class AddToCart extends CartEvent{
  final int productId;
  final int quantity;
   const AddToCart(this.productId, this.quantity);

  @override
  List<Object?> get props => [productId];
}


