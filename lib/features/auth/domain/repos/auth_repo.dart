import 'package:chatbot/core/errors/failure.dart';
import 'package:chatbot/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String fullName);

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password);

  Future <Either<Failure, UserEntity>> signInWithGoogle();
  Future <Either<Failure, UserEntity>> signInWithFacebook();
  Future <void> addUserData({required UserEntity user});
  Future <UserEntity> getUserData({required String userId});
  Future saveUserData({required UserEntity user});
}
