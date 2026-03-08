import 'package:advanced2/core/networking/api_result.dart';
import 'package:advanced2/features/login/data/models/login_request_body.dart';
import 'package:advanced2/features/login/data/repos/login_repo.dart';
import 'package:advanced2/features/login/logic/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/token_storage.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit({required this.loginRepo}) : super(const LoginState.initial());

  void emitLoginState(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final res = await loginRepo.login(loginRequestBody);
    res.when(
      success: (loginResponse) async {
        await TokenStorage.saveToken(loginResponse.data.token);
        emit(LoginState.success(loginResponse));
      },
      failure: (errorHandler) =>
          emit(LoginState.error(error: errorHandler.apiErrorModel.message)),
    );
  }
}
