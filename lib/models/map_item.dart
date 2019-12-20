import 'package:flutter/material.dart';

import '../enums/item_type.dart';

class MapItemModel {
  ///the name of the item (rebreather)
  final String title;

  ///description of use (allows breathing underwater)
  final String decription;

  ///Where the item is located (inside of cave 5, the Submerged Cave)
  final String locationDescription;

  ///the type of item(Cave,Gear,Collectable) used when filtering to either make visible or invisible
  //final MapItemType type;

  ///Whether or not the item is visible on the map if the user filters a specific [MapItemType] on or off
  final bool isVisible;

  ///An items location in x,y coordinates on the map
  final Offset offset;

  MapItemModel({
    this.title,
    this.decription,
    this.isVisible,
    this.offset,
    this.locationDescription,
   // this.type,
  });

  MapItemModel.fromJSON(Map<String, dynamic> json)
      : this.title = json["title"],
        this.decription = json["description"],
        this.locationDescription = json["locationDescription"],
        //this.type = json["type"],
        this.isVisible = true,
        this.offset = Offset(json["x"].toDouble(), json["y"].toDouble());
}
