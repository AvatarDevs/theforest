import 'package:flutter/material.dart';
import 'package:theforest/models/map_item.dart';
import 'package:theforest/widgets/interactive_map/item_view/item_view_desktop.dart';
import 'package:theforest/widgets/interactive_map/item_view/item_view_mobile.dart';
import 'package:theforest/widgets/responsive/screen_type_layout.dart';

class ItemView extends StatelessWidget {
  final MapItemModel model;

  const ItemView({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: ItemViewMobile(),
      desktop: ItemViewDesktop(),
    );
  }
}
