import 'package:bloc/bloc.dart';
import 'package:chatbot/features/auth/domain/entities/user_entity.dart';
import 'package:chatbot/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());

  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(SignInLoading());
    final result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold((failure) => emit(SignInFailure(errMessage: failure.message)),
        (user) => emit(SignInSuccess(user: user)));
  }

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold((failure) => emit(SignInFailure(errMessage: failure.message)),
        (user) => emit(SignInSuccess(user: user)));
  }

  Future<void> signInWithFacebook() async {
    emit(SignInLoading());
    final result = await authRepo.signInWithFacebook();
    result.fold((failure) => emit(SignInFailure(errMessage: failure.message)),
        (user) => emit(SignInSuccess(user: user)));
  }

  Future<void> signInWithApple() async {
    emit(SignInLoading());
    final result = await authRepo.signInWithApple();
    result.fold((failure) => emit(SignInFailure(errMessage: failure.message)),
        (user) => emit(SignInSuccess(user: user)));
  }
}
