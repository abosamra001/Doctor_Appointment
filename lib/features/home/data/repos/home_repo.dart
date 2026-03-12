import 'package:advanced2/core/networking/api_error_handler.dart';
import 'package:advanced2/core/networking/api_result.dart';
import 'package:advanced2/core/networking/api_service.dart';
import 'package:advanced2/features/home/data/models/specialization_response.dart';
import 'package:advanced2/features/home/data/models/user_response.dart';

class HomeRepo {
  final ApiService apiService;

  HomeRepo({required this.apiService});

  Future<ApiResult<SpecializationResponse>> getAllSpecializations() async {
    try {
      final res = await apiService.getAllSpecializations();
      return ApiResult.success(res);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<UserResponse>> getUserProfile() async {
    try {
      final res = await apiService.getUserProfile();
      return ApiResult.success(res);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
