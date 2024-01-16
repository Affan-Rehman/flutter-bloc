part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class WishListClickedEvent extends CartEvent {
  final ProductDataModel product;

  WishListClickedEvent({required this.product});
}

class CartItemRemoveEvent extends CartEvent {
  final ProductDataModel product;

  CartItemRemoveEvent({required this.product});
}

class CartInitialEvent extends CartEvent {}
