import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

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
}

//Add mutation class
class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store?.cartModel._itemIds.add(item.id);
  }
}

//Remove item mutation class
class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store?.cartModel._itemIds.remove(item.id);
  }
}
