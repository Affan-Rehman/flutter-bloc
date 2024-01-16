part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class WishListClickedEvent extends HomeEvent {}

class CartClickedEvent extends HomeEvent {}

class CartNavClickedEvent extends HomeEvent {}

class WishNavClickedEvent extends HomeEvent {}
