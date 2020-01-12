import 'package:theforest/tf/data/map_item_api.dart';
import 'package:theforest/tf/models/map_item.dart';

class MapItemRepository{
  MapItemApi _mapItemApi = MapItemApi();

  Future<List<List<MapItemModel>>> get fetchAllMapItems => _mapItemApi.fetch2dList();
}