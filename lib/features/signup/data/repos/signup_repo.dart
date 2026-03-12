import 'package:advanced2/core/networking/api_error_handler.dart';
import 'package:advanced2/core/networking/api_result.dart';
import 'package:advanced2/core/networking/api_service.dart';
import 'package:advanced2/features/signup/data/models/signup_request_body.dart';
import 'package:advanced2/features/signup/data/models/signup_response.dart';

class SignupRepo {
  final ApiService apiService;

  SignupRepo({required this.apiService});

  Future<ApiResult<SignupResponse>> signup(
    SignupRequestBody signupRequestBody,
  ) async {
    try {
      final res = await apiService.signup(signupRequestBody);
      return ApiResult.success(res);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
