import 'package:chatbot/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String userId;
  final String email;
  final String name;
  UserModel({required this.userId, required this.email, required this.name});

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

  toEntity() => UserEntity(userId: userId, email: email, name: name);
  toMap() {
    return {
      'email': email,
      'name': name,
      'userId': userId,
    };
  }
}
