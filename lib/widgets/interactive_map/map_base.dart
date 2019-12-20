import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:theforest/http/item_api.dart';
import 'package:theforest/viewmodels/map_activity_vm.dart';
import 'dart:ui' as ui;
import '../../models/map_item.dart';

import '../custom_painters/map_item_painter.dart';
import '../custom_painters/photo_painter.dart';

class PannableMapBase extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<MapActivityViewModel>(

          builder:(context,model,child)=> Center(
        child: FutureBuilder(
          future: getImage("assets/forestmap.jpg"),
          builder: (c, AsyncSnapshot<ui.Image> snapshot) => snapshot.hasData
              ? PhotoView.customChild(
                  child: Stack(
                    children: [
                      CustomPaint(
                        painter: PhotoPainter(snapshot.data),
                        // child: Container(width: 4096, height: 4096),
                      ),
                      FutureBuilder(
                        future: model.caveList,
                        builder: (c, s) => s.hasData
                            ? CustomPaint(
                                painter: MapItemPainter(s.data),
                                // child: Container(width: 4096, height: 4096),
                              )
                            : CircularProgressIndicator(),
                      )
                    ],
                  ),
                  childSize: Size(4096, 4096),
                  initialScale: PhotoViewComputedScale.covered * 1,
                  backgroundDecoration: BoxDecoration(color: Colors.transparent),
                  minScale: PhotoViewComputedScale.contained * .8,
                  maxScale: PhotoViewComputedScale.covered * 3,
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }

  Future<ui.Image> getImage(String asset) async {
    final ByteData data = await rootBundle.load(asset);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }

  
}
