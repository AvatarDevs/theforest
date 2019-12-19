import 'package:flutter/material.dart';
import 'package:theforest/activities/home/home_mobile.dart';
import 'package:theforest/widgets/responsive/screen_type_layout.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: HomeMobile(),
    );
  }
}