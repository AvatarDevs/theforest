import 'package:get_it/get_it.dart';
import 'package:theforest/tf/viewmodels/map_activity_vm.dart';


GetIt locator = GetIt.instance;

///register all of our singleton classes for use with Provider
void setupLocator() {
  locator.registerLazySingleton(() => MapActivityViewModel());
}
