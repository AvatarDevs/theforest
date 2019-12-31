import 'package:flutter/material.dart';

class ToggleButtonItem extends StatelessWidget {
  
  final String title;
  final String asset;

  const ToggleButtonItem({Key key,  this.title, this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    asset,
                    fit: BoxFit.contain,
                    width: 25,
                    height: 25,
                    color: Colors.yellow,filterQuality: FilterQuality.high,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  )
                ],
              )),
    );
  }
}
