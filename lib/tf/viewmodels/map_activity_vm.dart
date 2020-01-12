
import 'package:theforest/tf/data/map_item_api.dart';
import 'package:theforest/tf/models/map_item.dart';

class MapActivityViewModel {
  //init ItemAPI
  MapItemApi itemApi = MapItemApi();
  Future<List<List<MapItemModel>>> mapItemList;
  MapActivityViewModel() {
    mapItemList = itemApi.fetch2dList();
  }


  List<bool> selected = [false, false, false];


}
