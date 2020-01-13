import 'dart:convert';
import 'dart:io';

import '../models/map_item.dart';
import 'package:http/http.dart' as http;

class MapItemApi {
 static const String urlBase = "https://sonsoftheforest.firebaseio.com/flamelink/environments/production/content/";
  Future<List<MapItemModel>> fetchItems(String itemType) async {
    try {
      
      var response = await http.get('$urlBase$itemType/en-US/.json');
      Map<String, dynamic> parsed = json.decode(response.body);

      List<MapItemModel> temp = [];
      for (Map<String, dynamic> item in parsed.values) {
        temp.add(MapItemModel.fromJSON(item));
      }

      return temp;
    } on SocketException {
      throw Exception("Check your internet");
    }
  }

  Future<List<List<MapItemModel>>> fetch2dList() async {
    print("fetch1");
    try {
      print("fetch2");
      var caves = await fetchItems("cave");
      var collectables = await fetchItems("collectable");
      var gear = await fetchItems("gear");
      List<List<MapItemModel>> temp = [];

      temp.add(caves);
      temp.add(gear);
      temp.add(collectables);

      return temp;
    } catch (e) {
      print(e);
    }
  }
}
