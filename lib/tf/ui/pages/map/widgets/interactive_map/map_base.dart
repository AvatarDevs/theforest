import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:theforest/shared/utils/transform/gesture_transformable.dart';

import 'package:theforest/tf/blocs/map_image_bloc.dart';
import 'package:theforest/tf/blocs/map_item_bloc.dart';
import 'package:theforest/tf/blocs/map_item_bloc/bloc.dart';
import 'package:theforest/tf/data/api_response.dart';
import 'dart:ui' as ui;

import 'package:theforest/tf/models/map_item.dart';
import 'package:theforest/tf/ui/pages/map/custom_painters/map_item_painter.dart';
import 'package:theforest/tf/ui/pages/map/custom_painters/photo_painter.dart';
import 'package:theforest/tf/ui/pages/map/widgets/interactive_map/item_view/item_view.dart';
import 'package:theforest/tf/viewmodels/map_activity_vm.dart';

class PannableMapBase extends StatefulWidget {
  
  const PannableMapBase({Key key, }) : super(key: key);

  @override
  _PannableMapBaseState createState() => _PannableMapBaseState();
}

class _PannableMapBaseState extends State<PannableMapBase> {
  Offset tappedOffset;
  List<List<MapItemModel>> models;
  List<List<RRect>> rectList = [[], [], []];
  final ItemBloc _libItemBLoc = ItemBloc();
  MapImageBloc _imageBloc;
  @override
  void initState() {
    super.initState();
    _imageBloc = MapImageBloc();
    tappedOffset = Offset.zero;
    _libItemBLoc.add(GetItemsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MapActivityViewModel>(
      child: StreamBuilder(
        stream: _imageBloc.stream,
        initialData: Response.loading('loading image'),
        builder: (c, s) {
          switch (s.data.status) {
            case ResponseStatus.LOADING:
              return CircularProgressIndicator();
              break;
            case ResponseStatus.COMPLETED:
              return CustomPaint(
                painter: PhotoPainter(s.data.data),
              );
              break;
            case ResponseStatus.ERROR:
              return AlertDialog(
                title: Text("Error"),
              );
              break;
          }
        },
      ),
      builder: (context, model, child) => SafeArea(
        child: SizedBox(
          width: 4096,
          height: 4096,
          child: LayoutBuilder(builder: (c, constraints) {
            final Size size = Size(constraints.maxWidth, constraints.maxHeight);

            return GestureTransformable(
              size: size,
              child: Stack(
                children: [
                  child,
                  //bloc library experiment
                  BlocBuilder(
                    bloc: _libItemBLoc,
                    builder: (context, ItemState state) {
                      if (state is FetchedItemState) {
                        this.models = state.items;
                        if (models.length > 0) {
                          this.rectList = createRectsFromModel();
                          return CustomPaint(
                            painter: MapItemPainter(
                              models,
                              model.selected,
                              tappedOffset: tappedOffset,
                              rects: rectList,
                            ),
                          );
                        } else {
                          return AlertDialog(
                            title: Text("NO ITEMS FOUND"),
                          );
                        }
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  )
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
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _imageBloc.dispose();
    _libItemBLoc.close();
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
