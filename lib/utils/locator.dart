import 'package:get_it/get_it.dart';
import 'package:riverpod_template/constants/api_base_helper.dart';
import 'package:riverpod_template/repositories/auth_repository.dart';
import 'package:riverpod_template/utils/secure_storage.dart';


final GetIt locator = GetIt.instance;

Future<void> initDependencies() async {
  await locator.reset(dispose: true);

  /// Api Helper
  locator.registerLazySingleton(() => ApiBaseHelper());

  /// Auth
  locator.registerLazySingleton(() => AuthRepository());
  /// Secure Storage
  locator.registerLazySingleton(() => SecureStorage());
}
