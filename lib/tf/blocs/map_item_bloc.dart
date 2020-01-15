import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theforest/tf/data/api_response.dart';
import 'package:theforest/tf/repositories/map_item_repository.dart';

class MapItemBloc {
  MapItemRepository _repository;
  StreamController _controller;

  MapItemBloc() {
    _repository = MapItemRepository();
    _controller = StreamController<Response<dynamic>>();
    fetchMapItems();
  }

//TODO add types to streams
  StreamSink get sink => _controller.sink;
  Stream<Response<dynamic>> get stream => _controller.stream;

  fetchMapItems() async {
   
    try {
      sink.add(Response.completed([
        await _repository.fetchCaves,
        await _repository.fetchGear,
        await _repository.fetchCollectables,
      ]));
    } catch (e) {
      print("SINK ERROR");
      sink.add(Response.error(e.toString()));
    }
  }

  dispose() {
    _controller?.close();
    print("Disposed");
  }
}
