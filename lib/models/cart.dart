import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:provider/provider.dart';

class CartModel extends ChangeNotifier {
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

//Add item on items
  void AddItem(Item item) {
    _itemIds.add(item.id);
    //ask widgets to rebuild themselves who listening this
    notifyListeners();
  }

//Remove item on itemIds
  void RemoveItem(Item item) {
    _itemIds.remove(item.id);
    //ask widgets to rebuild themselves who listening this
    notifyListeners();
  }
}

// //Add mutation class
// class AddMutation extends VxMutation<MyStore> {
//   final Item item;

//   AddMutation(this.item);

//   @override
//   perform() {
//     store?.cartModel._itemIds.add(item.id);
//   }
// }

// //Remove item mutation class
// class RemoveMutation extends VxMutation<MyStore> {
//   final Item item;

//   RemoveMutation(this.item);

//   @override
//   perform() {
//     store?.cartModel._itemIds.remove(item.id);
//   }
// }
