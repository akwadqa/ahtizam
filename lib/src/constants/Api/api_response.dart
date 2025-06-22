// import 'package:json_annotation/json_annotation.dart';
// part 'api_response.g.dart';

// @JsonSerializable(genericArgumentFactories: true)
import 'package:ahtizam/src/constants/Api/pagination.dart';

class ApiResponse<T> {
  ApiResponse(this.status, this.message, this.data, this.pagination);

  ApiResponse.success({this.message, this.data, this.pagination})
      : status = 200;

  ApiResponse.error({this.message, this.error})
      : status = null,
        data = null,
        pagination = null;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    try {
      if (json['status_code'] != 200) {
        return ApiResponse<T>.error(
          message: json['message']?.toString() ?? 'Unknown error',
          error: json['data'], // May or may not be useful
        );
      } else {
        // T data;
        final rawData = json['data'];

        if (rawData is Map<String, dynamic> && rawData.isEmpty) {
          // return success with `data = null`
          return ApiResponse<T>.success(
            message: json['message'],
            data: null,
          );
        }

        return ApiResponse<T>.success(
          message: json['message'],
          pagination: json['pagination'] != null
              ? Pagination.fromJson(json['pagination'])
              : null,
          data: fromJsonT(rawData),
        );
        // data = fromJsonT(json['data']);
        // return ApiResponse<T>.success(
        //   message: json['message'],
        //   data: data,
        // );
      }
    } catch (error) {
      return ApiResponse<T>.error(message: error.toString(), error: error);
    }
  }
  final int? status;
  final String? message;
  final T? data;
  final Pagination? pagination;
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

  bool get hasSucceeded => status == 200;

  bool get hasFailed => status != 200 || status == null;
}
