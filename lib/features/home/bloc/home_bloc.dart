// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, unnecessary_set_literal, prefer_const_constructors

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/data/cart_items.dart';
import 'package:flutter_bloc_app/data/grocery_data.dart';
import 'package:flutter_bloc_app/data/wishlist_items.dart';
import 'package:flutter_bloc_app/features/home/models/home_product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<CartClickedEvent>(fun1);
    on<WishListClickedEvent>(fun2);
    on<HomeInitialEvent>(fun5);
    on<CartNavClickedEvent>(fun3);
    on<WishNavClickedEvent>(fun4);
  }

  FutureOr<void> fun3(CartNavClickedEvent event, Emitter<HomeState> emit) {
    log("ok");
    emit(CartHomeActionState());
  }

  FutureOr<void> fun1(CartClickedEvent event, Emitter<HomeState> emit) {
    cartItems.add(event.product);
    emit(ItemCartedState());
  }

  FutureOr<void> fun2(WishListClickedEvent event, Emitter<HomeState> emit) {
    wishlistItems.add(event.product);
    emit(ItemWishlistedState());
  }

  FutureOr<void> fun4(WishNavClickedEvent event, Emitter<HomeState> emit) {
    log("ok");
    emit(WishHomeActionState());
  }

  Future<FutureOr<void>> fun5(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    //purposely adding delay
    await Future.delayed(Duration(seconds: 3));

    emit(HomeLoadedState(
        products: GroceryData.groceryProducts
            .map((e) => ProductDataModel(
                id: e["id"],
                name: e["name"],
                description: e["description"],
                price: e["price"],
                imageUrl: e["imageUrl"]))
            .toList()));
  }
}
