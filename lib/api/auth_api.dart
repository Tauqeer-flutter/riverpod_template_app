import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../models/request/auth/login_request.dart';
import '../models/response/auth/login_response.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  //factory method
  factory AuthApi(Dio dio, {String? baseUrl}) = _AuthApi;

  //abstract method
  @POST('auth/login')
  Future<LoginResponse> login(@Body() LoginRequest request);
}
