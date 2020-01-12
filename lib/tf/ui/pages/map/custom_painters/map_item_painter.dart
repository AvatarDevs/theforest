import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:theforest/tf/models/map_item.dart';

class MapItemPainter extends CustomPainter {
  //consider passing in multiple lists of items - use the ToggleButtons to change whether or not to pass in a particular list
  final List<List<MapItemModel>> itemList;
  List<bool> selected;

  Offset tappedOffset;
  final List<List<RRect>> rects;
  
  MapItemPainter(this.itemList, this.selected,
      {this.tappedOffset, this.rects});

  @override
  void paint(Canvas canvas, Size size) {
    double boxwidth = 200;
    double boxHeight = 80;
    double triangleLength = 20;

    for (int i = 0; i < itemList.length; i++) {
      if (!selected[i]) {
        for (int j = 0; j < itemList[i].length; j++) {
          MapItemModel model = itemList[i][j];

         
              
          
          canvas.drawCircle(model.offset, 5, Paint());
          drawTrianglePath(canvas, model);
          canvas.drawRRect(rects[i][j], getPaintFromType(model.type));

          paintText(canvas, size, model.title, model.offset);
          //print(rrect.top);
          
        }
      }
    }
  }

  @override
  bool shouldRepaint(MapItemPainter oldDelegate) => false;

  Paint getPaintFromType(MapItemType type) {
    switch (type) {
      case MapItemType.Cave:
        // TODO: Handle this case.
        return Paint()..color = Colors.blue;
        break;
      case MapItemType.Gear:
        // TODO: Handle this case.
        return Paint()..color = Colors.red;
        break;
      case MapItemType.Collectable:
        // TODO: Handle this case.
        return Paint()..color = Colors.pink;
        break;
      case MapItemType.AnimalZone:
        // TODO: Handle this case.
        break;
      case MapItemType.PlantZone:
        // TODO: Handle this case.
        break;
    }
  }

  paintText(Canvas canvas, Size size, String text, Offset moffset) {
    final textStyle = ui.TextStyle(
      color: Colors.white,
      fontSize: 20,
    );
    final paragraphStyle = ui.ParagraphStyle(
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.start,
        maxLines: 1,
        ellipsis: "..");
    final paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
      ..pushStyle(textStyle)
      ..addText(text);
    final constraints = ui.ParagraphConstraints(width: 130);
    final paragraph = paragraphBuilder.build();
    paragraph.layout(constraints);
    final offset = Offset(25 + moffset.dx, -65 + moffset.dy);
    canvas.drawParagraph(paragraph, offset);
  }

  drawTrianglePath(Canvas canvas, var model) {
    Path trianglePath = Path();
    double triangleLength = 20;

    trianglePath.moveTo(model.offset.dx, model.offset.dy);
    trianglePath.lineTo(
        -triangleLength + model.offset.dx, -20 + model.offset.dy);
    trianglePath.lineTo(
        20 + model.offset.dx, -triangleLength + model.offset.dy);
    trianglePath.close();
    canvas.drawPath(trianglePath, getPaintFromType(model.type));
  }
}
