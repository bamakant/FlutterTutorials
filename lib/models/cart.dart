import 'package:flutter_catalog/models/catalog.dart';

class CartModel {

//Catalog Model
  late CatalogModel _catalog;

//Cart List items ids
  final List<int> _itemIds = [];

//Get catalog
  CatalogModel get catalog => _catalog;

// set catalog
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

//Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //Get total price
  num get totalPrice =>
      items.fold(0, (previousValue, element) => previousValue + element.price);

//Add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

//Remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
