import 'package:advanced2/core/networking/api_error_handler.dart';
import 'package:advanced2/core/networking/api_result.dart';
import 'package:advanced2/core/networking/api_service.dart';
import 'package:advanced2/features/login/data/models/login_request_body.dart';
import 'package:advanced2/features/login/data/models/login_response.dart';

class LoginRepo {
  final ApiService apiService;
  const LoginRepo({required this.apiService});

  Future<ApiResult<LoginResponse>> login(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final res = await apiService.login(loginRequestBody);
      return ApiResult.success(res);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
