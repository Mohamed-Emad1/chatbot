import 'package:bloc/bloc.dart';
import 'package:chatbot/features/auth/domain/entities/user_entity.dart';
import 'package:chatbot/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
      String email, String password, String fullName) async {
    emit(SignupLoading());
    final result = await authRepo.createUserWithEmailAndPassword(
        email, password, fullName);
    result.fold((failure) => emit(SignupFailure(errMessage: failure.message)),
        (user) => emit(SignupSuccess(user: user)));
  }
}
