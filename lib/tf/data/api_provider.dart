import 'package:theforest/tf/models/map_item.dart';

abstract class ApiProvider{

  String _baseUrl;
  
  List<MapItemModel> fetch(String itemType);




}