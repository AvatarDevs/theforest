import 'package:meta/meta.dart';

@immutable
abstract class ItemEvent {}

class GetItemsEvent extends ItemEvent{}
