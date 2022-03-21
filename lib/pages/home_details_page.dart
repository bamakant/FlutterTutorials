import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailsPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$ ${catalog.price}".text.xl4.red800.bold.make(),
            ElevatedButton(
              onPressed: () {},
              child: "Buy".text.xl.bold.make(),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(MyTheme.darkBluishColor),
                  shape: MaterialStateProperty.all(const StadiumBorder())),
            ).wh(100, 50)
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
                    color: Colors.white,
                    child: Column(
                      children: [
                        catalog.name.text.bold.xl4
                            .color(MyTheme.darkBluishColor)
                            .make(),
                        catalog.desc.text.xl
                            .textStyle(context.captionStyle!)
                            .make(),
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
