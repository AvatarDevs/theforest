import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theforest/shared/utils/transform/gesture_transformable.dart';
import 'package:theforest/shared/utils/type_to_image.dart';
import 'package:theforest/tf/blocs/map_item_bloc.dart';
import 'dart:ui' as ui;

import 'package:theforest/tf/models/map_item.dart';
import 'package:theforest/tf/ui/pages/map/custom_painters/map_item_painter.dart';
import 'package:theforest/tf/ui/pages/map/custom_painters/photo_painter.dart';
import 'package:theforest/tf/ui/pages/map/widgets/interactive_map/item_view/item_view.dart';
import 'package:theforest/tf/viewmodels/map_activity_vm.dart';

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
  MapItemBloc _bloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tappedOffset = Offset.zero;
    _bloc = MapItemBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MapActivityViewModel>(
      builder: (context, model, child) => Center(
          child: SafeArea(
        child: SizedBox(
          width: 4096,
          height: 4096,
          child: LayoutBuilder(builder: (c, constraints) {
            final Size size = Size(constraints.maxWidth, constraints.maxHeight);
            print("building");

            return GestureTransformable(
              size: size,
              child: Stack(
                children: [
                  FutureBuilder(
                    future: ItemTypeToImage.getImageFromString(
                        "assets/forestmap.jpg"),
                    builder: (c, AsyncSnapshot<ui.Image> snapshot) =>
                        snapshot.hasData
                            ? CustomPaint(
                                painter: PhotoPainter(snapshot.data),
                                // child: Container(width: 4096, height: 4096),
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              ),
                  ),
                  StreamBuilder(
                      stream: _bloc.stream,
                      initialData: [],
                      builder: (c, s) {
                        if (s.hasData) {
                          if (s.data.length > 0) {
                            this.models = s.data;
                            this.rectList = createRectsFromModel();
                            return CustomPaint(
                              painter: MapItemPainter(
                                s.data,
                                model.selected,
                                tappedOffset: tappedOffset,
                                rects: rectList,
                              ),
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
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
      )),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _bloc.dispose();
    super.dispose();
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
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              builder: (c) => ItemView(model: item));
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
