import 'package:flutter/material.dart';

class ToggleButtonItem extends StatelessWidget {
  final Widget child;

  const ToggleButtonItem({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: child,
    );
  }
}
