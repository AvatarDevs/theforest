import 'package:flutter/material.dart';
import 'package:theforest/widgets/toggle_buttons/toggle_button_item.dart';

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
          child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/cave.png',
                    fit: BoxFit.contain,
                    width: 25,
                    height: 25,
                  ),
                  Text(
                    "caves",
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  )
                ],
              )),
        ),
        ToggleButtonItem(
          child:Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/axe.png',
                    fit: BoxFit.contain,
                    width: 25,
                    height: 25,
                  ),
                  Text(
                    "gear",
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  )
                ],
              )),
        ),
        ToggleButtonItem(
          child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/mglass.png',
                    fit: BoxFit.contain,
                    width: 25,
                    height: 25,
                  ),
                  Text(
                    "items",
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  )
                ],
              )),
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
