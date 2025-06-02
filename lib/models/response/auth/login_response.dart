import 'package:json_annotation/json_annotation.dart';

import '../../base_response.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends BaseResponse {
  final String? data;

  const LoginResponse({super.isSuccess, super.message, this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseFromJson(json);
  }
}
