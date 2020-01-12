import 'package:flutter/widgets.dart';


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
enum DeviceScreenType {
  Mobile,
  Tablet,
  Desktop,
}

