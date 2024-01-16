import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter_bloc_app/features/wishlist/ui/wishlist_Item.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wish Items'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishActionState,
        buildWhen: (previous, current) => current is! WishActionState,
        listener: (context, state) {
          if (state is RemovedWishState) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Item Removed from WishList!")));
          } else if (state is AddedCartItemState) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Item Added to Cart!")));
          }
        },
        builder: (context, state) {
          if (state is WishlistLoaded) {
            return state.products.isNotEmpty
                ? ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      return WishlistTileWidget(
                          wishBloc: wishlistBloc,
                          productDataModel: state.products[index]);
                    })
                : const Center(
                    child: Text("Wishlist is empty"),
                  );
          } else if (state is WishlistLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text("Error occured"));
          }
        },
      ),
    );
  }
}
