import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class PhotoPainter extends CustomPainter {
  PhotoPainter(
    this.image,
  );
  final ui.Image image;
  @override
  void paint(Canvas canvas, Size size) {
    
    canvas.drawImage(image, Offset.zero, Paint());
    
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
