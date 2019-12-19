import 'dart:math';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PannableMapBase extends StatelessWidget {
  //implement streambuilder
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: PhotoView.customChild(
            child: Stack(
              children: [
                //CustomPaint(painter: PhotoPainter(),child: Container(width:4096,height:4096),)
                ...generateWidgets(50, Size(4096, 4096)),
                //Image.asset("assets/forestmap.jpg")
              ],
            ),
            childSize: Size(4096, 4096),
            initialScale: PhotoViewComputedScale.covered * 1,
            backgroundDecoration: BoxDecoration(color: Colors.transparent),
            minScale: PhotoViewComputedScale.contained * 1.2,
            maxScale: PhotoViewComputedScale.covered * 3,
          ),
      ),
    );
  }
}

List<Widget> generateWidgets(int count, Size size) {
  print(size);
  return List.generate(count, (count) {
    double top = (Random().nextDouble() * size.height).roundToDouble();
    double left = (Random().nextDouble() * size.width).roundToDouble();
    return Positioned(
      top: top,
      left: left,
      child: InkWell(
        splashColor: Colors.blue,
        onTap: () {
          print("$count pressed at $top from the top and $left from the left");
        },
        child: Container(color: Colors.green, child: Text(count.toString())),
      ),
    );
  });
}

class PhotoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    print(size);

    canvas.drawCircle(
        Offset(200, size.height / 2), 25, Paint()..color = Colors.black);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
