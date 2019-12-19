
import 'package:flutter/material.dart';

import '../../models/map_item.dart';

class MapItemPainter extends CustomPainter {
  //consider passing in multiple lists of items - use the ToggleButtons to change whether or not to pass in a particular list
  final List<MapItemModel> itemList;
  MapItemPainter(this.itemList);

  @override
  void paint(Canvas canvas, Size size) {
    for(int i = 0 ; i<itemList.length; i++){
      canvas.drawCircle(itemList[i].offset, 30 , Paint()..color=Colors.blue);
    }
  }

  @override
  bool shouldRepaint(MapItemPainter oldDelegate) => false;

}