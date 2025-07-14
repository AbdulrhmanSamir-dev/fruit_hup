import 'package:fruit_hup/services/user_service.dart';
import 'package:get_it/get_it.dart';

import 'navigation_service.dart';


GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<UserService>(UserService());

  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
}
