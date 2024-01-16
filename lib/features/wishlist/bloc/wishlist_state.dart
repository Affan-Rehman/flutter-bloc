part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

final class WishActionState extends WishlistState {}

final class WishlistInitial extends WishlistState {}

final class WishlistLoading extends WishlistState {}

final class WishlistLoaded extends WishlistState {
  final List<ProductDataModel> products;

  WishlistLoaded({required this.products});
}

final class RemovedWishState extends WishActionState {}

final class AddedCartItemState extends WishActionState {}
