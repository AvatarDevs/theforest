import 'package:theforest/http/item_api.dart';
import 'package:theforest/models/map_item.dart';

class MapActivityViewModel {
  //init ItemAPI
  ItemApi itemApi = ItemApi();
  Future<List<List<MapItemModel>>> mapItemList;
  MapActivityViewModel() {
    mapItemList = itemApi.fetch2dList();
  }


  List<bool> selected = [false, false, false];
}
