import 'package:meta/meta.dart';
import 'package:theforest/tf/models/map_item.dart';

@immutable
abstract class ItemState {}

class InitialItemState extends ItemState {}

class FetchedItemState extends ItemState {
  final List<List<MapItemModel>> items;
  FetchedItemState(this.items);
}

class ErrorItemState extends ItemState {}
