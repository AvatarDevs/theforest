import 'package:flutter/material.dart';

import '../../../widgets/interactive_map/map_base.dart';

class ForestMapActivity extends StatefulWidget {
  @override
  _ForestMapActivityState createState() => _ForestMapActivityState();
}

class _ForestMapActivityState extends State<ForestMapActivity> {


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,backgroundColor: Colors.transparent,),
      body: Stack(children: <Widget>[
      PannableMapBase()
      ],),
    );
  }
}