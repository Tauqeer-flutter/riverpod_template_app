import 'package:riverpod_template/constants/api_base_helper.dart';
import 'package:riverpod_template/models/request/auth/login_request.dart';
import 'package:riverpod_template/models/response/auth/login_response.dart';
import 'package:riverpod_template/utils/enums.dart';

class AuthRepository {
  final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();

  Future<LoginResponse> login({
    required String email,
    required String password,
  }) async {
    final request = LoginRequest(email: email, password: password);
    final response = await _apiBaseHelper.post(
      EndPoints.login.url,
      request.toJson(),
      requiresAuth: false,
    );
    return LoginResponse.fromJson(response);
  }
}
