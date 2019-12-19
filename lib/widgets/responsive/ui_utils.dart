import 'package:flutter/widgets.dart';

import 'package:theforest/enums/screen_type.dart';

///Checks the width of the screen to determine the screen type

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  
  double deviceWidth = mediaQuery.size.width;

  if (deviceWidth > 950) {
    return DeviceScreenType.Desktop;
  }
  if (deviceWidth > 600) {
    return DeviceScreenType.Tablet;
  }
  return DeviceScreenType.Mobile;
}
