import 'package:supabase_flutter/supabase_flutter.dart';

class UserAuthModel {
  final String id;
  final String email;
  final String? phone;
  final String createdAt;

  UserAuthModel({
    required this.id,
    required this.email,
    this.phone,
    required this.createdAt,
  });

  factory UserAuthModel.fromSupabaseUser(User user) {
    return UserAuthModel(
      id: user.id,
      email: user.email ?? '',
      phone: user.phone,
      createdAt: user.createdAt,
    );
  }
}
