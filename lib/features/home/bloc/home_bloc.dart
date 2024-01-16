// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, unnecessary_set_literal

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<CartClickedEvent>(fun1);
    on<WishListClickedEvent>(fun2);

    on<CartNavClickedEvent>(fun3);
    on<WishNavClickedEvent>(fun4);
  }

  FutureOr<void> fun3(CartNavClickedEvent event, Emitter<HomeState> emit) {
    log("ok");
    emit(CartHomeActionState());
  }

  FutureOr<void> fun1(CartClickedEvent event, Emitter<HomeState> emit) {
    log("ok1");
  }

  FutureOr<void> fun2(WishListClickedEvent event, Emitter<HomeState> emit) {
    log("ok1");
  }

  FutureOr<void> fun4(WishNavClickedEvent event, Emitter<HomeState> emit) {
    log("ok");
    emit(WishHomeActionState());
  }
}
