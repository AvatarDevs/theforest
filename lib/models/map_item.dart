import 'package:flutter/material.dart';
import 'package:theforest/utils/type_to_image.dart';

import '../enums/item_type.dart';
import 'dart:ui' as ui;

class MapItemModel {
  ///the name of the item (rebreather)
  final String title;

  ///description of use (allows breathing underwater)
  final String decription;

  ///Where the item is located (inside of cave 5, the Submerged Cave)
  final String locationDescription;

  ///the type of item(Cave,Gear,Collectable)
  final MapItemType type;

  ///Whether or not the item is visible on the map if the user filters a specific [MapItemType] on or off
  final bool isVisible;

  ///An items location in x,y coordinates on the map
  final Offset offset;

  // final ui.Image image;

  MapItemModel({
    this.title,
    this.decription,
    this.isVisible,
    this.offset,
    this.locationDescription,
    this.type,
  });

  MapItemModel.fromJSON(Map<String, dynamic> json)
      : this.title = json["title"],
        this.decription = json["description"],
        this.locationDescription = json["locationDescription"],
        this.type = getTypeFromString(json["type"]),
        this.isVisible = true,
        this.offset = Offset(json["x"].toDouble(), json["y"].toDouble());

  static MapItemType getTypeFromString(String value) {
    switch (value) {
      case "cave":
        return MapItemType.Cave;
        break;
      case "gear":
        return MapItemType.Gear;
        break;
      case "collectable":
        return MapItemType.Collectable;
        break;
      default:
        return null;
    }
  }
}
