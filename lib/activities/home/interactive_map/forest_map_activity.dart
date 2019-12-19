import 'package:flutter/material.dart';

import '../../../widgets/interactive_map/map_base.dart';

class ForestMapActivity extends StatelessWidget {
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