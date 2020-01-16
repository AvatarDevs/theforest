import 'dart:async';

import 'package:theforest/tf/data/api_response.dart';
import 'package:theforest/tf/repositories/map_image_repository.dart';

///traditional bloc no library
class MapImageBloc {
  MapImageRepository _repository;
  StreamController _controller;

  MapImageBloc() {
    _repository = MapImageRepository();
    _controller = StreamController();
    sendMapImage();
  }

  StreamSink get sink => _controller.sink;
  Stream get stream => _controller.stream;

  void sendMapImage() async {
    
    try {
      sink.add(Response.completed(await _repository.mapImage));
    } catch (e) {
      sink.add(Response.error("image error"));
    }
  }

  dispose() {
    _controller?.close();
    print("Disposed");
  }
}
