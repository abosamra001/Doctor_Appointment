import 'package:advanced2/core/networking/token_storage.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  const DioFactory._();

  static Dio? dio;

  static Future<Dio> getDio() async {
    if (dio == null) {
      const Duration timeOut = Duration(seconds: 30);
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      addDioInterceptors();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptors() {
    dio!.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
    dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final hasValidToken = await TokenStorage.hasValidToken();
          if (hasValidToken) {
            final token = await TokenStorage.getToken();
            options.headers['Accept'] = 'application/json';
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
      ),
    );
  }
}
