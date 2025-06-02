import 'package:riverpod_template/utils/locator.dart';

import '../api/auth_api.dart';

class AuthRepository {
  final AuthApi _authApi = locator<AuthApi>();

  Future<void> login({required String email, required String password}) async {
    /// Implement logic to login user using API.
  }
}
