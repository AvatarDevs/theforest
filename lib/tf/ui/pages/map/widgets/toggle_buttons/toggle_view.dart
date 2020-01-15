import 'package:flutter/material.dart';
import 'package:theforest/tf/ui/pages/map/widgets/toggle_buttons/toggle_button.dart';

class ToggleView extends StatefulWidget {
  ToggleView({Key key}) : super(key: key);

  @override
  _ToggleViewState createState() => _ToggleViewState();
}

class _ToggleViewState extends State<ToggleView> {
  bool showMenuItems = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.yellow,
                        ),
                        onPressed: () {
                          setState(() {
                            showMenuItems = !showMenuItems;
                          });
                        },
                      ),
                      AnimatedOpacity(
                        opacity: showMenuItems ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 250),
                        child: IgnorePointer(
                          ignoring: !showMenuItems,
                          child: MapToggleButtons(),
                        ),
                      )
                    ],
                  ),
                ),
              );
  }
}