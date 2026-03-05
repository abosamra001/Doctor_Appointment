import 'package:advanced2/core/networking/api_service.dart';
import 'package:advanced2/core/networking/dio_factory.dart';
import 'package:advanced2/features/home/data/repos/home_repo.dart';
import 'package:advanced2/features/home/logic/cubit/home_cubit.dart';
import 'package:advanced2/features/login/data/repos/login_repo.dart';
import 'package:advanced2/features/login/logic/cubit/login_cubit.dart';
import 'package:advanced2/features/signup/data/repos/signup_repo.dart';
import 'package:advanced2/features/signup/logic/cubit/signup_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(apiService: getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(loginRepo: getIt()));

  // Signup
  getIt.registerLazySingleton<SignupRepo>(
    () => SignupRepo(apiService: getIt()),
  );
  getIt.registerFactory<SignupCubit>(() => SignupCubit(signupRepo: getIt()));

  // home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(apiService: getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(homeRepo: getIt()));
}
