import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/data/cart_items.dart';
import 'package:flutter_bloc_app/data/wishlist_items.dart';
import 'package:flutter_bloc_app/features/home/models/home_product_data_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<RemoveWishItem>(fun2);

    on<AddCartItem>(fun3);
    on<WishInitialEvent>(fun1);
  }

  Future<FutureOr<void>> fun1(
      WishInitialEvent event, Emitter<WishlistState> emit) async {
    emit(WishlistLoading());
    await Future.delayed(const Duration(milliseconds: 1500));
    emit(WishlistLoaded(products: wishlistItems));
  }

  FutureOr<void> fun2(RemoveWishItem event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.product);
    emit(RemovedWishState());
    emit(WishlistLoaded(products: wishlistItems));
  }

  FutureOr<void> fun3(AddCartItem event, Emitter<WishlistState> emit) {
    cartItems.add(event.product);
    emit(AddedCartItemState());
  }
}
