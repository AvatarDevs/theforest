import 'package:flutter/material.dart';
import 'package:theforest/activities/home/interactive_map/sons_map_activity.dart';
import 'package:theforest/utils/transform/transform_demo.dart';

import '../../widgets/responsive/size_restriction.dart';
import 'interactive_map/forest_map_activity.dart';

class HomeMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Center(
        child: WidthRestriction(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text("The Forest"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForestMapActivity(),
                    ),
                  );
                },
              ),
              FlatButton(
                  child: Text("Sons of the Forest(COMING SOON)"),
                  onPressed:(){

                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransformationsDemo(),
                    ),
                  );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
