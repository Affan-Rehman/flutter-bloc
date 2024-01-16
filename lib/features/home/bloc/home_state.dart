part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

//two types of states
//simple states: displaying data
//action states: taking some action, navigation wagheira

abstract class HomeActionState extends HomeState {}

//in real time, we fetch data, bring it and display it, and if there is error, these are the 4 states
class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<ProductDataModel> products;

  HomeLoadedState({required this.products});
}

class HomeErrorState extends HomeState {}

class CartHomeActionState extends HomeActionState {}

class WishHomeActionState extends HomeActionState {}

class ItemWishlistedState extends HomeActionState {}

class ItemCartedState extends HomeActionState {}
