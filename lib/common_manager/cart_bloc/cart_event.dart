

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

class LoadCart extends CartEvent {
  const LoadCart();
}
class IncrementProduct extends CartEvent{
  final int productId;

  IncrementProduct(this.productId);
}
class DecrementProduct extends CartEvent{
  final int productId;

  DecrementProduct(this.productId);
}
class ClearCart extends CartEvent {
  const ClearCart();
}


