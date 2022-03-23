import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailsPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      appBar: AppBar(),
      bottomNavigationBar: Container(
        color: context.theme.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$ ${catalog.price}".text.xl4.red800.bold.make(),
            AddToCart(catalog: catalog)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
              child: VxArc(
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  height: 30.0,
                  child: Container(
                    width: context.screenWidth,
                    color: context.theme.cardColor,
                    child: Column(
                      children: [
                        catalog.name.text.bold.xl4
                            .color(context.accentColor)
                            .make(),
                        catalog.desc.text.xl
                            .textStyle(context.captionStyle!)
                            .make(),
                        "Mihi duco adfero, puer pasco homo aduro missa. Tametsi esse pia illa, renuo uter. Premo picea. Loci letum demum abbas ceterum puteus suus metuo. Suus autus abeo queso putus faenum. Corrigo lenio. Illa quris aurum sequi utrum taceo, pyropus quantum. Frequentatio immineo lacrima opportunitatus."
                            .text
                            .textStyle(context.captionStyle!)
                            .make()
                            .p16()
                            .expand(),
                      ],
                    ).py64(),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
