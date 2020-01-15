import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theforest/locator.dart';
import 'package:theforest/tf/ui/pages/map/widgets/interactive_map/map_base.dart';
import 'package:theforest/tf/ui/pages/map/widgets/toggle_buttons/toggle_button.dart';
import 'package:theforest/tf/viewmodels/map_activity_vm.dart';

class ForestMapActivity extends StatefulWidget {
  @override
  ForestMapActivityState createState() => ForestMapActivityState();
}

class ForestMapActivityState extends State<ForestMapActivity> {
  bool showMenuItems = true;

  @override
  Widget build(BuildContext context) {
    return Provider<MapActivityViewModel>(
      create: (context) => locator<MapActivityViewModel>(),
      child: Scaffold(
        body: Container(
          child: Stack(
            children: <Widget>[
              PannableMapBase(),
              Positioned(
                top: 40,
                left: 25,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                  color: Colors.yellow,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
