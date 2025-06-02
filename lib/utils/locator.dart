import 'package:get_it/get_it.dart';
import 'package:riverpod_template/api/auth_api.dart';
import 'package:riverpod_template/repositories/auth_repository.dart';

import '../resources/api_constants.dart';

final GetIt locator = GetIt.instance;

Future<void> initDependencies() async {
  await locator.reset(dispose: true);

  /// Auth
  locator.registerLazySingleton(() => AuthApi(dio));
  locator.registerLazySingleton(() => AuthRepository());
}
