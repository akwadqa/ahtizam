// import 'package:json_annotation/json_annotation.dart';
// part 'api_response.g.dart';

// @JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  ApiResponse(this.status, this.message, this.data);

  ApiResponse.success({this.message, this.data}) : status = true;

  ApiResponse.error({this.message, this.error})
      : status = false,
        data = null;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    try {
      if (json['status_code'] == false) {
        return ApiResponse<T>.error(
          message: json['message'],
          error: json['data'],
        );
      } else {
        T data;
        data = fromJsonT(json['data']);
        return ApiResponse<T>.success(
          message: json['message'],
          data: data,
        );
      }
    } catch (error) {
      return ApiResponse<T>.error(message: error.toString(), error: error);
    }
  }
  final bool? status;
  final String? message;
  final T? data;
  dynamic error;
  Map<String, dynamic> toJson() => {
        'status_code': status,
        'message': message,
        'data': data,
        'error': error,
      };
  @override
  String toString() {
    return 'ApiResponse{status: $status, message: $message, data: $data, error: $error}';
  }

  bool get hasSucceeded => status == true;

  bool get hasFailed => status == false || status == null;
}
