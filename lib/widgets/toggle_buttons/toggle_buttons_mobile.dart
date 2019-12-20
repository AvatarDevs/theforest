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
      children: <Widget>[
        ToggleButtonItem(
          child: Icon(Icons.ac_unit),
        ),
        ToggleButtonItem(
          child: Icon(Icons.add_shopping_cart),
        ),
        ToggleButtonItem(
          child: Icon(Icons.airline_seat_flat),
        ),
      ],
      isSelected: widget._selected,
      onPressed: (int index) {
        setState(() {
          widget._selected[index] = !widget._selected[index];
        });
      },
      color: Colors.white38,
      selectedColor:Colors.white38 ,
      borderColor: Colors.black45,
      fillColor: Colors.black45,
      
     
    );
  }
}
