import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theforest/locator.dart';
import 'package:theforest/viewmodels/map_activity_vm.dart';
import 'package:theforest/widgets/toggle_buttons/toggle_button.dart';

import '../../../widgets/interactive_map/map_base.dart';

class ForestMapActivity extends StatefulWidget {
  @override
  _ForestMapActivityState createState() => _ForestMapActivityState();
}

class _ForestMapActivityState extends State<ForestMapActivity> {
  bool showMenuItems = true;
  @override
  Widget build(BuildContext context) {
    return Provider<MapActivityViewModel>(
      create: (context) => locator<MapActivityViewModel>(),
      child: GestureDetector(
        onTap: () {
          setState(() {
            showMenuItems = !showMenuItems;
          });
        },
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              PannableMapBase(),
              Positioned(
                top: 40,
                left: 25,
                child: AnimatedOpacity(
                  opacity: showMenuItems ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 250),
                  child: IgnorePointer(
                    ignoring: !showMenuItems,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                          ),
                          color: Colors.white38,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        MapToggleButtons()
                      ],
                    ),
                  ),
                ),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}
