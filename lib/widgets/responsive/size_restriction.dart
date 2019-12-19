import 'package:flutter/material.dart';

///Layout builder that restricts maximum width
///
class WidthRestriction extends StatelessWidget {
  final Widget child;

  WidthRestriction({this.child});
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 1000),
      child: Center(child: child),
    );
  }
}
