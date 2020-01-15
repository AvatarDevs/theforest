import 'package:theforest/tf/models/map_item.dart';

abstract class ApiProvider{

  Future<List<MapItemModel>> fetchItems(String itemType);

}