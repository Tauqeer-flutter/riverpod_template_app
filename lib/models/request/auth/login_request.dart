import 'package:json_annotation/json_annotation.dart';

import '../../base_request.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest extends BaseRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  @override
  Map<String, dynamic> toJson() {
    return _$LoginRequestToJson(this);
  }
}
