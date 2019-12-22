import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:theforest/enums/item_type.dart';

class ItemTypeToImage {
  static Future<ui.Image> getImageFromItemType(MapItemType type) async {
    switch (type) {
      case MapItemType.Cave:
        return getImageFromString("assets/cave.png");
        break;
      case MapItemType.Gear:
        return getImageFromString("assets/gear.png");
        break;
      case MapItemType.Collectable:
        return getImageFromString("assets/collectable.png");
        break;
      case MapItemType.AnimalZone:
        return getImageFromString("assets/animal.png");
        break;
      case MapItemType.PlantZone:
        return getImageFromString("assets/plant.png");
        break;
    }
  }

  static Future<ui.Image> getImageFromString(String asset) async {
    final ByteData data = await rootBundle.load(asset);
    return getImageFromBytes(data);
  }

  static Future<ui.Image> getImageFromBytes(ByteData data) async {
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo frameInfo = await codec.getNextFrame();
    return frameInfo.image;
  }
}
