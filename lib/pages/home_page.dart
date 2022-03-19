import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import '../widgets/item_widget.dart';
import '/widgets/drawer.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    // await Future.delayed(const Duration(seconds: 2));

    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    int days = 30;
    String codepur = "Codepur";

    // final dummyList = List.generate(10, (index) => CatalogModel.items[0]);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items.isNotEmpty)
            ? GridView.builder(
                itemCount: CatalogModel.items.length,
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                      clipBehavior: Clip.antiAlias,
                      color: Colors.deepPurple.shade200,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                        header: Container(
                          child: Text(
                            item.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                          padding: const EdgeInsets.all(10),
                          decoration:
                              const BoxDecoration(color: Colors.deepPurple),
                        ),
                        child: Image.network(item.image),
                        footer: Container(
                          child: Text(
                            "\$ ${item.price.toString()}",
                            style: const TextStyle(color: Colors.white),
                          ),
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(color: Colors.black),
                        ),
                      ));
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
