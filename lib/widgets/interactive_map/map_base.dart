import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:theforest/activities/home/interactive_map/forest_map_activity.dart';
import 'package:theforest/http/item_api.dart';
import 'package:theforest/utils/transform/gesture_transformable.dart';
import 'package:theforest/utils/type_to_image.dart';
import 'package:theforest/viewmodels/map_activity_vm.dart';
import 'package:theforest/widgets/interactive_map/item_view/item_view.dart';
import 'dart:ui' as ui;
import '../../models/map_item.dart';

import '../custom_painters/map_item_painter.dart';
import '../custom_painters/photo_painter.dart';

class PannableMapBase extends StatefulWidget {
  final Function callback;

  const PannableMapBase({Key key, this.callback}) : super(key: key);

  @override
  _PannableMapBaseState createState() => _PannableMapBaseState();
}

class _PannableMapBaseState extends State<PannableMapBase> {
  Offset tappedOffset;
  List<List<MapItemModel>> models;
  List<List<RRect>> rectList = [[], [], []];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tappedOffset = Offset.zero;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MapActivityViewModel>(
      builder: (context, model, child) => Center(
        child: FutureBuilder(
          future: ItemTypeToImage.getImageFromString("assets/forestmap.jpg"),
          builder: (c, AsyncSnapshot<ui.Image> snapshot) => snapshot.hasData
              ? SafeArea(
                  child: SizedBox(
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
                                builder: (c, s) {
                                  if (s.hasData) {
                                    this.models = s.data;
                                    this.rectList = createRectsFromModel();
                                    return CustomPaint(
                                      painter: MapItemPainter(
                                          s.data, model.selected,
                                          tappedOffset: tappedOffset,
                                          rects: rectList),
                                      // child: Container(width: 4096, height: 4096),
                                    );
                                  } else {
                                    return CircularProgressIndicator();
                                  }
                                }),
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
                  ),
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }

  void _onTapUp(TapUpDetails details) {
    final Offset scenePoint = details.globalPosition;

    //final BoardPoint boardPoint = _board.pointToBoardPoint(scenePoint);
    /*  setState(() {
      _board = _board.copyWithSelected(boardPoint);
    }); */
pointToModel(scenePoint);
   
  }

   pointToModel(Offset scenePoint) {
    MapItemModel item;
    for (int i = 0; i < models.length; i++) {
      for (int j = 0; j < models[i].length; j++) {
        if (rectList[i][j].contains(scenePoint)) {
          item = models[i][j];
          print(item.title);
          showModalBottomSheet(context: context,builder: (c)=>ItemView(model:item));
        }
      }
    }
  }

  List<List<RRect>> createRectsFromModel() {
    List<List<RRect>> list = [[], [], []];

    double boxwidth = 200;
    double boxHeight = 80;
    double triangleLength = 20;
    for (int i = 0; i < models.length; i++) {
      for (int j = 0; j < models[i].length; j++) {
        list[i].add(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(-triangleLength - 15 + models[i][j].offset.dx,
                models[i][j].offset.dy - boxHeight - 15, boxwidth, boxHeight),
            Radius.circular(20),
          ),
        );
      }
    }
    return list;
  }
}
