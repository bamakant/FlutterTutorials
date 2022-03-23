import 'package:flutter/material.dart';
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
            const _CartList().p32().expand(),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        "\$9999".text.xl4.make(),
        ElevatedButton(
          onPressed: () {},
          child: "Buy".text.make(),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(context.theme.buttonColor)),
        ).w32(context),
      ],
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        title: "Item 1".text.make(),
        trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.remove_circle_outline_outlined)),
      ),
    );
  }
}
