import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:theforest/tf/repositories/map_item_repository.dart';
import './bloc.dart';

///flutter_bloc implementation
class ItemBloc extends Bloc<ItemEvent, ItemState> {
  MapItemRepository _repository;

  ItemBloc() {
    _repository = MapItemRepository();
  }
  @override
  ItemState get initialState => InitialItemState();

  @override
  Stream<ItemState> mapEventToState(
    ItemEvent event,
  ) async* {
    try {
      if (event is GetItemsEvent) {
        yield FetchedItemState([
          await _repository.fetchCaves,
          await _repository.fetchGear,
          await _repository.fetchCollectables,
        ]);
      }
    } catch (e) {
      yield ErrorItemState();
    }
  }
}
