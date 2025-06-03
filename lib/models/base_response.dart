import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
 class BaseResponse {
  final bool? isSuccess;
  final String? message;

  const BaseResponse({this.isSuccess, this.message});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return _$BaseResponseFromJson(json);
  }
}
