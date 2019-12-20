import 'package:theforest/http/item_api.dart';
import 'package:theforest/models/map_item.dart';

class MapActivityViewModel {
  //init ItemAPI
  ItemApi itemApi = ItemApi();
   Future<List<List<MapItemModel>>> caveList;
  MapActivityViewModel() {
    caveList =  itemApi.fetch2dList();
  }

  void initLists() async {
    
  }

  List<bool> selected = [false, false, false];
}
