import 'package:gacayte_f_d/model/categoriesModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoyApi {
  String urlItem = 'https://gacaytehotel.pythonanywhere.com/api/category/';
  Future<List<Categories>> getCategoryList() async {
    List itemList = [];
    var url = Uri.parse(urlItem);
    var result = await http.get(url);
    if (result.statusCode == 200) {
      var data = jsonDecode(result.body);
      itemList = data;
      return itemList.map((e) => Categories.fromJson(e)).toList();
    } else {
      throw Exception(result.reasonPhrase);
    }
  }
}
