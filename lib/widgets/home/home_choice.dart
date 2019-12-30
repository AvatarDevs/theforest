import 'package:flutter/material.dart';
import 'package:theforest/activities/home/interactive_map/forest_map_activity.dart';
import 'package:theforest/utils/transform/transform_demo.dart';

class HomeGameChoices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          child: Image.asset(
            "assets/forest-logo.png",
            width: 175,
            height: 150,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ForestMapActivity(),
              ),
            );
          },
        ),
        Divider(indent: 20,endIndent: 20,color: Colors.black,),
        InkWell(
          child: Image.asset(
            "assets/sotflogo.png",
            fit: BoxFit.cover,
            width: 220,
            height: 190,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TransformationsDemo(),
              ),
            );
          },
        ),
      ],
    );
  }
}
