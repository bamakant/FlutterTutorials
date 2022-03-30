import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // VxState.watch(context, on: [AddMutation, RemoveMutation]);
    // final CartModel _cart = (VxState.store as MyStore).cartModel;
    // bool isInCart = _cart.items.contains(catalog);
    return Consumer<CartModel>(
      builder: ((context, cart, child) {
        bool isInCart = cart.items.contains(catalog);
        return ElevatedButton(
          onPressed: () {
            if (!isInCart) {
              final _catalog = CatalogModel();
              cart.catalog = _catalog;
              cart.AddItem(catalog);
            }
          },
          child: isInCart
              ? const Icon(Icons.done)
              : const Icon(CupertinoIcons.cart_badge_plus),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(context.theme.buttonColor),
              shape: MaterialStateProperty.all(const StadiumBorder())),
        );
      }),
    );
  }
}
