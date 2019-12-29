import 'package:flutter/material.dart';
import 'package:theforest/models/map_item.dart';

class ItemView extends StatelessWidget {

  final MapItemModel model;

  const ItemView({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(child: Text(model.title)),
    );
  }
}