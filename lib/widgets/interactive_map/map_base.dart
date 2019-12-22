import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:theforest/http/item_api.dart';
import 'package:theforest/utils/transform/gesture_transformable.dart';
import 'package:theforest/utils/type_to_image.dart';
import 'package:theforest/viewmodels/map_activity_vm.dart';
import 'dart:ui' as ui;
import '../../models/map_item.dart';

import '../custom_painters/map_item_painter.dart';
import '../custom_painters/photo_painter.dart';

class PannableMapBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MapActivityViewModel>(
      builder: (context, model, child) => Center(
        child: FutureBuilder(
          future: ItemTypeToImage.getImageFromString("assets/forestmap.jpg"),
          builder: (c, AsyncSnapshot<ui.Image> snapshot) => snapshot.hasData
              ? SizedBox(
                  width: 4096,
                  height: 4096,
                  child: LayoutBuilder(builder: (c, constraints) {
                    final Size size =
                        Size(constraints.maxWidth, constraints.maxHeight);

                    return GestureTransformable(
                      size: size,
                      child: Stack(
                        children: [
                          CustomPaint(
                            painter: PhotoPainter(snapshot.data),
                            // child: Container(width: 4096, height: 4096),
                          ),
                          FutureBuilder(
                            future: model.mapItemList,
                            builder: (c, s) => s.hasData
                                ? CustomPaint(
                                    painter:
                                        MapItemPainter(s.data, model.selected),
                                    // child: Container(width: 4096, height: 4096),
                                  )
                                : CircularProgressIndicator(),
                          ),
                        ],
                      ),
                      boundaryRect: Rect.fromLTWH(
                        0,
                        0,
                        4096,
                        4096,
                      ),
                      onTapUp: _onTapUp,
                      disableRotation: true,
                      minScale: .2,
                      maxScale: 2,
                    );
                  }),
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }

  void _onTapUp(TapUpDetails details) {
    final Offset scenePoint = details.globalPosition;
    print(scenePoint);
    //final BoardPoint boardPoint = _board.pointToBoardPoint(scenePoint);
    /*  setState(() {
      _board = _board.copyWithSelected(boardPoint);
    }); */
  }
}
