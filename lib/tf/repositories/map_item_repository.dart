import 'package:theforest/tf/data/map_item_api.dart';
import 'package:theforest/tf/models/map_item.dart';

class MapItemRepository {
  MapItemApi _api = MapItemApi();
  
  Future<List<MapItemModel>> get fetchCollectables async => await _api.fetchItems("collectable");
  
  Future<List<MapItemModel>> get fetchCaves async => await _api.fetchItems("cave");

  Future<List<MapItemModel>> get fetchGear async => await _api.fetchItems("gear");

}
