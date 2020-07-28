import 'package:get_it/get_it.dart';
import 'package:com.ci.flutter/data/network/network.dart';
import 'package:com.ci.flutter/data/repository/repository.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Network());
  locator.registerLazySingleton(() => HomeRepository(locator<Network>()));
}
