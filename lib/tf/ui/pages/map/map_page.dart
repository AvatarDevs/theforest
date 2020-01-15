import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theforest/locator.dart';
import 'package:theforest/tf/ui/pages/map/widgets/interactive_map/map_base.dart';
import 'package:theforest/tf/ui/pages/map/widgets/toggle_buttons/toggle_button.dart';
import 'package:theforest/tf/ui/pages/map/widgets/toggle_buttons/toggle_view.dart';
import 'package:theforest/tf/viewmodels/map_activity_vm.dart';

class ForestMapActivity extends StatefulWidget {
  @override
  ForestMapActivityState createState() => ForestMapActivityState();
}

class ForestMapActivityState extends State<ForestMapActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Provider<MapActivityViewModel>(
          create: (context) => locator<MapActivityViewModel>(),
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
              ToggleView()
            ],
          ),
        ),
      ),
    );
  }
}
