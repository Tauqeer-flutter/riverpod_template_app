import 'package:riverpod_template/models/request/auth/login_request.dart';
import 'package:riverpod_template/models/response/auth/login_response.dart';
import 'package:riverpod_template/utils/locator.dart';

import '../api/auth_api.dart';

class AuthRepository {
  final AuthApi _authApi = locator<AuthApi>();

  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    final request = LoginRequest(email: email, password: password);
    final response = await _authApi.login(request);
    return response;
  }
}
