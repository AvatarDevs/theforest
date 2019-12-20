import 'package:flutter/material.dart';

import '../../models/map_item.dart';

class MapItemPainter extends CustomPainter {
  //consider passing in multiple lists of items - use the ToggleButtons to change whether or not to pass in a particular list
  final List<List<MapItemModel>> itemList;
  MapItemPainter(this.itemList);

  @override
  void paint(Canvas canvas, Size size) {
    for(int i = 0; i <itemList.length; i++){

      for(int j = 0; j<itemList[i].length;j++){
        canvas.save();
        canvas.drawCircle(itemList[i][j].offset, 25, Paint()..color = Colors.blue);
        canvas.translate(0, 25);
        canvas.drawRect(Rect.fromLTWH(itemList[i][j].offset.dx , itemList[i][j].offset.dy, 50, 20), Paint()..color=Colors.red);

        canvas.restore();
      }

    }
  }

  @override
  bool shouldRepaint(MapItemPainter oldDelegate) => false;
}
