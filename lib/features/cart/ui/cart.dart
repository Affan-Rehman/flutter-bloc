import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/features/cart/bloc/cart_bloc.dart';
import 'package:flutter_bloc_app/features/cart/ui/cart_tile_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartState();
}

class _CartState extends State<CartScreen> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    // cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Items'),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {},
        // listenWhen: (previous, current) => current is CartActionState,
        // buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          // switch (state.runtimeType) {
          // case CartSuccessState:
          //   final successState = state as CartSuccessState;
          // return ListView.builder(
          //     itemCount: successState.cartItems.length,
          //     itemBuilder: (context, index) {
          //       return CartTileWidget(
          //           cartBloc: cartBloc,
          //           productDataModel: successState.cartItems[index]);
          //     });

          //   default:
          // }
          return Container();
        },
      ),
    );
  }
}
