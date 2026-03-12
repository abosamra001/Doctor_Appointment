import 'package:dio/dio.dart';

import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: 'Connection timeout with the server');
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
            message: 'Send timeout in connection with the server',
          );
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
            message: 'Recieve timeout in connection with the server',
          );
        case DioExceptionType.badCertificate:
          return ApiErrorModel(message: 'Bad Certificate');
        case DioExceptionType.badResponse:
          return _handleError(error.response!.data);
        case DioExceptionType.cancel:
          return ApiErrorModel(message: 'Request to the server was cancelled');
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: 'Connection to server failed');
        case DioExceptionType.unknown:
          return ApiErrorModel(message: 'Unknown error occurred');
      }
    } else {
      // default error
      return ApiErrorModel(message: 'Something went wrong');
    }
  }
}

ApiErrorModel _handleError(dynamic error) {
  return ApiErrorModel(
    message: error['message'] ?? 'Something went wrong',
    subErrors: error['data'] is Map ? error['data'] : {},
  );
}
