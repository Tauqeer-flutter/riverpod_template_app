class BaseResponseModel {
   String? status;
  String? message;

  BaseResponseModel({
    this.status,
    this.message,
  });

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) {
    String? parsedMessage;

    // Check the type of 'message'
    if (json['message'] is String) {
      parsedMessage = json['message'];
    } else if (json['message'] is Map<String, dynamic> &&
        json['message']['error'] is List) {
      List<dynamic> errors = json['message']['error'];
      parsedMessage = errors.isNotEmpty ? errors[0] as String : null;
    }

    return BaseResponseModel(
      status: json['status'],
      message: parsedMessage,
    );
  }
}
