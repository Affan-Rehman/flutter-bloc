part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

abstract class CartActionState extends CartState {}

final class CartInitialState extends CartState {}

final class CartLoadedState extends CartState {
  final List<ProductDataModel> products;

  CartLoadedState({required this.products});
}

final class CartLoadingState extends CartState {}

final class AddedToWishlistState extends CartActionState {}

final class RemovedFromCartState extends CartActionState {}
