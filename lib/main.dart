import 'package:flutter/material.dart';
import 'package:theforest/locator.dart';
import 'package:theforest/tf/ui/pages/home/home_page.dart';

import 'themes/ui_theme.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //showPerformanceOverlay: true,
      title: 'Flutter Demo',
      theme: darkTheme,
      home: Home(),
    );
  }
}
