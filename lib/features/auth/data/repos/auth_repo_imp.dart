import 'dart:convert';
import 'dart:developer';

import 'package:chatbot/core/errors/custom_exception.dart';
import 'package:chatbot/core/errors/failure.dart';
import 'package:chatbot/core/services/database_service.dart';
import 'package:chatbot/core/services/firebase_auth_service.dart';
import 'package:chatbot/core/services/shared_prefrences_singletone.dart';
import 'package:chatbot/core/utils/backend_endpoints.dart';
import 'package:chatbot/core/utils/constant.dart';
import 'package:chatbot/features/auth/data/models/user_model.dart';
import 'package:chatbot/features/auth/domain/entities/user_entity.dart';
import 'package:chatbot/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImp extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImp(
      {required this.databaseService, required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String fullName) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity =
          UserEntity(userId: user.uid, email: email, name: fullName);
      await addUserData(user: userEntity);

      return right(userEntity);
    } on CustomExceptions catch (e) {
      deleteUser(user);
      log("Exception is created in AuthRepoImp in create user with email and password : ${e.toString()}");
      return left(ServerFailure(e.message));
    } catch (e) {
      deleteUser(user);
      log("Exception is created in AuthRepoImp in create user with email and password : ${e.toString()}");
      return left(ServerFailure(e.toString()));
    }
  }

  void deleteUser(User? user) {
    if (user != null) {
      firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    UserEntity userEntity;
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassord(
          email: email, password: password);
      // var isUserExist = await databaseService.isUserExist(
      //     path: BackendEndpoints.isUserExist, documentId: user.uid);

      // if (isUserExist) {
      userEntity = await getUserData(userId: user.uid);
      saveUserData(user: userEntity);
      // }

      return right(userEntity);
    } on CustomExceptions catch (e) {
      log("Exception is created in AuthRepoImp sign in with email and password : ${e.toString()}");
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user).toEntity();
      var isUserExist = await databaseService.isUserExist(
          path: BackendEndpoints.isUserExist, documentId: user.uid);
      if (isUserExist) {
        await getUserData(userId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      deleteUser(user);
      log("Exception is created in AuthRepoImp sign in with google : ${e.toString()}");
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user).toEntity();
      var isUserExist = await databaseService.isUserExist(
          path: BackendEndpoints.isUserExist, documentId: user.uid);
      if (isUserExist) {
        await getUserData(userId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      saveUserData(user: userEntity);
      return Right(userEntity);
    } on CustomExceptions catch (e) {
      deleteUser(user);
      log("Exception is created in AuthRepoImp sign in with facebook : ${e.toString()}");
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> addUserData({required UserEntity user}) async {
    await databaseService.addData(
        documentId: user.userId,
        path: BackendEndpoints.addUserData,
        data: UserModel.fromEntity(user).toMap());
  }

  @override
  Future<UserEntity> getUserData({required String userId}) async {
    var userData = await databaseService.getData(
        path: BackendEndpoints.getUserData, documentId: userId);

    return UserModel.fromJson(userData).toEntity();
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    final jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await SharedPreferencesSingleton.setstring(kUserData, jsonData);
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithApple();
      var userEntity = UserModel.fromFirebaseUser(user).toEntity();
      var isUserExist = await databaseService.isUserExist(
          path: BackendEndpoints.isUserExist, documentId: user.uid);
      if (isUserExist) {
        await getUserData(userId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      deleteUser(user);
      log("Exception is created in AuthRepoImp sign in with apple : ${e.toString()}");
      return left(ServerFailure(e.toString()));
    }
  }
}
