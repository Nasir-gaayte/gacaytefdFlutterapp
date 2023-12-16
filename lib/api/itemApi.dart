import 'package:gacayte_f_d/model/itemModle.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ItemApi {
  String urlItem = 'https://gacaytehotel.pythonanywhere.com/api/item/';
  Future<List<Items>> getItemList() async {
    List itemList = [];
    var url = Uri.parse(urlItem);
    var result = await http.get(url);
    if (result.statusCode == 200) {
      var data = json.decode(result.body);
      
      itemList = data;
      return itemList.map((e) => Items.fromJson(e)).toList();
    
    } else {
      throw Exception(result.reasonPhrase);
    }
    
  }
}
