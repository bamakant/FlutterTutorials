import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      appBar: AppBar(
        title: "Cart".text.color(context.theme.accentColor).make(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _CartList().p32().expand(),
            const Divider(),
            const _CartTotal()
          ],
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cartModel;
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
            mutations: const {RemoveMutation},
            builder: (BuildContext context, store, VxStatus? status) {
              return "\$${_cart.totalPrice}".text.xl4.make();
            },
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "Buying not supported yet".text.make()));
            },
            child: "Buy".text.make(),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.buttonColor)),
          ).w32(context),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cartModel;
    return !_cart.items.isNotEmpty
        ? "No items to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              title: _cart.items[index].name.text.make(),
              trailing: IconButton(
                  onPressed: () => RemoveMutation(_cart.items[index]),
                  icon: const Icon(Icons.remove_circle_outline_outlined)),
            ),
          );
  }
}
