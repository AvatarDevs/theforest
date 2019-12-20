import 'package:flutter/material.dart';
import 'package:theforest/activities/home/home.dart';
import 'package:theforest/locator.dart';

import 'themes/ui_theme.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme,
      home: Home(),
    );
  }
}
