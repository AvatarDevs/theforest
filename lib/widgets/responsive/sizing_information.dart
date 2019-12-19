import 'package:flutter/material.dart';

import 'package:theforest/enums/screen_type.dart';

///information about the screen size 
class SizingInformation {
  final DeviceScreenType deviceScreenType;
  final Size screenSize;
  final Size localWidgetSize;

  SizingInformation({
    this.deviceScreenType,
    this.screenSize,
    this.localWidgetSize,
  });

  @override
  String toString() {
    // TODO: implement toString
    return '''
      DeviceType:$deviceScreenType, 
      ScreenSize:$screenSize, 
      LocalWidgetSize:$localWidgetSize
      ''';
  }
}
