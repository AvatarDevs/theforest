import 'package:flutter/material.dart';
import 'package:theforest/activities/home/interactive_map/sons_map_activity.dart';
import 'package:theforest/utils/transform/transform_demo.dart';
import 'package:theforest/widgets/home/home_choice.dart';

import '../../widgets/responsive/size_restriction.dart';
import 'interactive_map/forest_map_activity.dart';

class HomeMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                "assets/forestbg.jpg",
                fit: BoxFit.cover,
              )),
          Center(
            child: WidthRestriction(
              child: HomeGameChoices(),
            ),
          ),
        ],
      ),
    );
  }
}
