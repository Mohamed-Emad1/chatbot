import 'package:chatbot/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({required super.userId, required super.email, required super.name});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
        userId: user.uid,
        email: user.email ?? '',
        name: user.displayName ?? '');
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['uid'] as String? ?? '', // Handle null case
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? 'No Name', // Provide fallback value
    );
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(userId: user.userId, email: user.email, name: user.name);
  }
  toMap() {
    return {
      'email': email,
      'name': name,
      'userId': userId,
    };
  }
}
