import 'dart:convert';
import 'dart:io';

import 'package:theforest/tf/data/api_provider.dart';

import '../models/map_item.dart';
import 'package:http/http.dart' as http;

class MapItemApi extends ApiProvider{
  static const String urlBase ="https://sonsoftheforest.firebaseio.com/flamelink/environments/production/content/";
 
 
  Future<List<MapItemModel>> fetchItems(String itemType) async {
    try {
      var response = await http.get('$urlBase$itemType/en-US/.json');

      List<MapItemModel> temp = [];

      for (Map<String, dynamic> item in json.decode(response.body).values) {
        temp.add(MapItemModel.fromJSON(item));
      }

      return temp;
    } on SocketException {
      throw Exception("Check your internet");
    }
  }
}
