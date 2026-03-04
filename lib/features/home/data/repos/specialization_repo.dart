import 'package:advanced2/core/networking/api_error_handler.dart';
import 'package:advanced2/core/networking/api_result.dart';
import 'package:advanced2/core/networking/api_service.dart';
import 'package:advanced2/features/home/data/models/specialization_response.dart';

class SpecializationRepo {
  final ApiService apiService;

  SpecializationRepo({required this.apiService});

  Future<ApiResult<SpecializationResponse>> getAllSpecializations() async {
    try {
      final res = await apiService.getAllSpecializations();
      return ApiResult.success(res);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
