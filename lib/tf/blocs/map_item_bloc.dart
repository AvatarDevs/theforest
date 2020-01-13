
import 'dart:async';

import 'package:theforest/tf/data/api_response.dart';
import 'package:theforest/tf/repositories/map_item_repository.dart';


class MapItemBloc {

  MapItemRepository _repository;
  StreamController _controller;

  MapItemBloc(){
    _repository = MapItemRepository();
    _controller = StreamController();
  }

//TODO add types to streams
  StreamSink get sink => _controller.sink;
  Stream get stream => _controller.stream;

  






  dispose(){
    _controller?.close();
  }
}