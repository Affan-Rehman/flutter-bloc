part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class RemoveWishItem extends WishlistEvent {
  final ProductDataModel product;

  RemoveWishItem({required this.product});
}

class AddCartItem extends WishlistEvent {
  final ProductDataModel product;

  AddCartItem({required this.product});
}

class WishInitialEvent extends WishlistEvent {}
