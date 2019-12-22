import 'package:flutter/material.dart';
import 'package:theforest/enums/item_type.dart';
import 'dart:ui' as ui;
import '../../models/map_item.dart';

class MapItemPainter extends CustomPainter {
  //consider passing in multiple lists of items - use the ToggleButtons to change whether or not to pass in a particular list
  final List<List<MapItemModel>> itemList;
  MapItemPainter(this.itemList);

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < itemList.length; i++) {
      for (int j = 0; j < itemList[i].length; j++) {
        MapItemModel model = itemList[i][j];
        canvas.save();
        canvas.translate(model.offset.dx, model.offset.dy);
        canvas.drawCircle(
          Offset.zero,
          50,
          getPaintFromType(model.type),
        );

        canvas.drawRRect(
            RRect.fromRectAndRadius(
              Rect.fromLTWH(-80, 30, 175, 80),
              Radius.circular(20),
            ),
            Paint()..color = Colors.red);

        paintText(canvas, size, model.title);

        // canvas.drawParagraph(paragraph, offset)

        canvas.restore();
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

  paintText(Canvas canvas, Size size, String text) {
     final textStyle = ui.TextStyle(
    color: Colors.black,
    fontSize: 30,
  );
  final paragraphStyle = ui.ParagraphStyle(
    textDirection: TextDirection.ltr,
    textAlign: TextAlign.center
  );
  final paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
    ..pushStyle(textStyle)
    ..addText(text);
  final constraints = ui.ParagraphConstraints(width: 175);
  final paragraph = paragraphBuilder.build();
  paragraph.layout(constraints);
  final offset = Offset(-80, 25);
  canvas.drawParagraph(paragraph, offset);
  }
}
