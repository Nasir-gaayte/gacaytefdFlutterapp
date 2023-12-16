import 'package:flutter/material.dart';
import 'package:gacayte_f_d/api/itemApi.dart';
import 'package:gacayte_f_d/model/itemModle.dart';

class ItemApiProvider extends ChangeNotifier {
  final _itemApi = ItemApi();
  List<Items> _items = [];
  List<Items> get items => _items;

  Future getAlllItems() async {
    final response = await _itemApi.getItemList();
    _items = response;
    notifyListeners();
  }
}
