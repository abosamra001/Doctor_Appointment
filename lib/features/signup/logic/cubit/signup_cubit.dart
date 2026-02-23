import 'package:advanced2/core/networking/api_result.dart';
import 'package:advanced2/features/signup/data/models/signup_request_body.dart';
import 'package:advanced2/features/signup/data/repos/signup_repo.dart';
import 'package:advanced2/features/signup/logic/cubit/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo signupRepo;
  SignupCubit({required this.signupRepo}) : super(const SignupState.initial());

  Future<void> emitSignupState(SignupRequestBody signupRequestBody) async {
    emit(const SignupState.loading());
    final res = await signupRepo.signup(signupRequestBody);
    res.when(
      success: (signupResponse) => emit(SignupState.success(signupResponse)),
      failure: (error) =>
          emit(SignupState.error(errorModel: error.apiErrorModel)),
    );
  }
}
