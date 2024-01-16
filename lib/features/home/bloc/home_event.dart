part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class WishListClickedEvent extends HomeEvent {
  final ProductDataModel product;

  WishListClickedEvent({required this.product});
}

class CartClickedEvent extends HomeEvent {
  final ProductDataModel product;

  CartClickedEvent({required this.product});
}

class CartNavClickedEvent extends HomeEvent {}

class WishNavClickedEvent extends HomeEvent {}
