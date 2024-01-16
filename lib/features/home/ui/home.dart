// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/features/cart/ui/cart.dart';
import 'package:flutter_bloc_app/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_app/features/wishlist/ui/wishlist.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final HomeBloc homebloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homebloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is WishHomeActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => WishListScreen()));
        } else if (state is CartHomeActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => CartScreen()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            actions: [
              IconButton(
                  onPressed: () {
                    homebloc.add(WishNavClickedEvent());
                  },
                  icon: Icon(Icons.favorite)),
              IconButton(
                  onPressed: () {
                    homebloc.add(CartNavClickedEvent());
                  },
                  icon: Icon(Icons.shopping_cart))
            ],
            title: Text("Cart App"),
          ),
          body: Center(
            child: Text('Hello World!'),
          ),
        );
      },
    );
  }
}
