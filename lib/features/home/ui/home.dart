// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/features/cart/ui/cart.dart';
import 'package:flutter_bloc_app/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_app/features/home/ui/product_tile_widget.dart';
import 'package:flutter_bloc_app/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homebloc = HomeBloc();
  @override
  void initState() {
    homebloc.add(HomeInitialEvent());
    super.initState();
  }

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
        } else if (state is ItemCartedState) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Item Added to Cart!")));
        } else if (state is ItemWishlistedState) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Item Added to WishList!")));
        }
      },
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: Text("Cart App",
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is HomeLoadedState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              actions: [
                IconButton(
                  onPressed: () {
                    homebloc.add(WishNavClickedEvent());
                  },
                  icon: Icon(Icons.favorite),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {
                    homebloc.add(CartNavClickedEvent());
                  },
                  icon: Icon(Icons.shopping_cart),
                  color: Colors.white,
                )
              ],
              title: Text("Cart App",
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
            body: ListView.builder(
              itemBuilder: (context, index) {
                return ProductTileWidget(
                    productDataModel: state.products[index],
                    homeBloc: homebloc);
              },
              itemCount: state.products.length,
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: Text("Cart App",
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
            body: Center(child: Text("Error occured")),
          );
        }
      },
    );
  }
}
