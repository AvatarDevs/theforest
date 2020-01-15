import 'package:flutter/material.dart';
import 'package:theforest/tf/ui/pages/map/widgets/toggle_buttons/toggle_button_item.dart';

class ToggleButtonsMobile extends StatefulWidget {
  List<bool> _selected;
  ToggleButtonsMobile(this._selected);

  @override
  _ToggleButtonsMobileState createState() => _ToggleButtonsMobileState();
}

class _ToggleButtonsMobileState extends State<ToggleButtonsMobile> {
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      textStyle: TextStyle(
        fontSize: 12,
      ),
      children: <Widget>[
        ToggleButtonItem(
          title: "caves",
          asset: "assets/cave.png",
        ),
        ToggleButtonItem(
          title: "gear",
          asset: "assets/axe.png",
        ),
        ToggleButtonItem(
          title: "items",
          asset: "assets/mglass.png",
        ),
      ],
      isSelected: widget._selected,
      onPressed: (int index) {
        setState(() {
          widget._selected[index] = !widget._selected[index];
        });
      },
      color: Colors.white38,
      selectedColor: Colors.white38,
      borderColor: Colors.black45,
      fillColor: Colors.black45,
    );
  }
}
