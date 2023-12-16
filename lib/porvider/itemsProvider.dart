import 'package:flutter/material.dart';
import 'package:gacayte_f_d/model/categoriesModel.dart';

import 'package:provider/provider.dart';
import 'package:gacayte_f_d/model/itemModle.dart';

class ItemProvider extends ChangeNotifier {
  late List<Items> _items = [];
  late List<Categories> _cat = [];
  List<Items> get items => _items;
  List<Categories> get cat => _cat;

  void addItems(Items items, int qyt) {
    for (var i = 0; i < qyt; i++) {
      _items.add(items);
    }
    notifyListeners();
  }

  void removeFormCart(Items items) {
    _items.remove(items);
    notifyListeners();
  }

  void getItems(Items val) {
    items.add(val);
    notifyListeners();
  }

  Future deleteIems(int index) async {
    await items.remove(index);
    notifyListeners();
  }
}

setGetItem(context, val) {
  Provider.of<ItemProvider>(context, listen: false).getItems(val);
}

List items(context) {
  List items = Provider.of<ItemProvider>(context, listen: false).items;
  return items;
}
