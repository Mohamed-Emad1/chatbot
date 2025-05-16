import 'dart:convert';

import 'package:chatbot/core/services/shared_prefrences_singletone.dart';
import 'package:chatbot/core/utils/constant.dart';
import 'package:chatbot/features/auth/data/models/user_model.dart';
import 'package:chatbot/features/auth/domain/entities/user_entity.dart';

UserEntity getUser() {
  var json = SharedPreferencesSingleton.getString(kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(json)).toEntity();
  return userEntity;
}
