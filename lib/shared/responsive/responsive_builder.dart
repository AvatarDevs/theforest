import 'package:flutter/material.dart';
import 'package:theforest/shared/responsive/ui_utils.dart';


import 'sizing_information.dart';

///checks the media query and returns a builder with the [SizingInformation]
class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    SizingInformation sizingInformation,
  ) builder;

  const ResponsiveBuilder({
    Key key,
    this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return LayoutBuilder(builder: (
      context,
      constraints,
    ) {
      var sizingInformation = SizingInformation(
        screenSize: mediaQuery.size,
        deviceScreenType: getDeviceType(mediaQuery),
        localWidgetSize: Size(
          constraints.maxWidth,
          constraints.maxHeight,
        ),
      );
      return builder(context, sizingInformation);
    });
  }
}
