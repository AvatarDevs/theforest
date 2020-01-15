
import 'dart:ui' as ui;

import 'package:theforest/tf/data/map_image_provider.dart';

class MapImageRepository{
  Future<ui.Image> get mapImage async => await MapImageProvider.getImageFromString("assets/forestmap.jpg");
}