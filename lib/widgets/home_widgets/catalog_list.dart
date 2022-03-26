import 'package:flutter/material.dart';
import 'package:flutter_catalog/pages/home_details_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import 'add_to_cart.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.isMobile
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: ((context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomeDetailsPage(catalog: catalog))),
                  child: CatalogItem(catalog: catalog));
            }))
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: ((context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomeDetailsPage(catalog: catalog))),
                  child: CatalogItem(catalog: catalog));
            }),
          );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({required this.catalog, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
            child: context.isMobile
                ? Row(
                    children: [
                      Hero(
                          tag: Key(catalog.id.toString()),
                          child: CatalogImage(image: catalog.image)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            catalog.name.text.bold.lg
                                .color(context.accentColor)
                                .make(),
                            catalog.desc.text
                                .textStyle(context.captionStyle!)
                                .make(),
                            10.heightBox,
                            ButtonBar(
                              buttonPadding: EdgeInsets.zero,
                              alignment: MainAxisAlignment.spaceBetween,
                              children: [
                                "\$ ${catalog.price}".text.make(),
                                AddToCart(
                                  catalog: catalog,
                                ).pOnly(right: 8)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )
                : Column(
                    children: [
                      Hero(
                          tag: Key(catalog.id.toString()),
                          child: CatalogImage(image: catalog.image)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            catalog.name.text.bold.lg
                                .color(context.accentColor)
                                .make(),
                            catalog.desc.text
                                .textStyle(context.captionStyle!)
                                .make(),
                            10.heightBox,
                            ButtonBar(
                              buttonPadding: EdgeInsets.zero,
                              alignment: MainAxisAlignment.spaceBetween,
                              children: [
                                "\$ ${catalog.price}".text.make(),
                                AddToCart(
                                  catalog: catalog,
                                ).pOnly(right: 8)
                              ],
                            )
                          ],
                        ).px16(),
                      )
                    ],
                  ))
        .color(context.cardColor)
        .rounded
        .square(150)
        .make()
        .py8();
  }
}
