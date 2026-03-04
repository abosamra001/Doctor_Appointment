import 'package:advanced2/core/networking/api_constants.dart';
import 'package:advanced2/features/home/data/models/specialization_response.dart';
import 'package:advanced2/features/login/data/models/login_request_body.dart';
import 'package:advanced2/features/login/data/models/login_response.dart';
import 'package:advanced2/features/signup/data/models/signup_request_body.dart';
import 'package:advanced2/features/signup/data/models/signup_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(@Body() SignupRequestBody signupRequestBody);

  @GET(ApiConstants.specialization)
  Future<SpecializationResponse> getAllSpecializations();
}
