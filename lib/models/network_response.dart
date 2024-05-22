import 'dart:convert';

class NetworkResponse {
  bool success;
  String message;
  dynamic data;
  NetworkResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  NetworkResponse copyWith({
    bool? success,
    String? message,
    dynamic data,
  }) {
    return NetworkResponse(
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'message': message,
      'data': data,
    };
  }

  factory NetworkResponse.fromMap(Map<String, dynamic> map) {
    return NetworkResponse(
      success: map['success'] ?? false,
      message: map['message'] ?? '',
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NetworkResponse.fromJson(String source) =>
      NetworkResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'NetworkResponse(success: $success, message: $message, data: $data)';
}
