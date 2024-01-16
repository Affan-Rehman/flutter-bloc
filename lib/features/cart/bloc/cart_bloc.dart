import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/data/cart_items.dart';
import 'package:flutter_bloc_app/data/wishlist_items.dart';
import 'package:flutter_bloc_app/features/home/models/home_product_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<WishListClickedEvent>(fun1);
    on<CartItemRemoveEvent>(fun2);
    on<CartInitialEvent>(fun3);
  }

  FutureOr<void> fun1(WishListClickedEvent event, Emitter<CartState> emit) {
    wishlistItems.add(event.product);
    emit(AddedToWishlistState());
  }

  FutureOr<void> fun2(CartItemRemoveEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.product);
    emit(RemovedFromCartState());
    emit(CartLoadedState(products: cartItems));
  }

  Future<FutureOr<void>> fun3(
      CartInitialEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());
    await Future.delayed(const Duration(milliseconds: 1500));
    emit(CartLoadedState(products: cartItems));
  }
}
