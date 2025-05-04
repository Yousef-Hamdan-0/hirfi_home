// lib/data/repositories/auth_user_repository.dart

import 'package:hirfi_home/data/model/auth/user_auth_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthUserRepository {
  final _client = Supabase.instance.client;

  /// جلب بيانات المستخدم الحالي
  UserAuthModel? getCurrentUser() {
    final user = _client.auth.currentUser;
    if (user == null) return null;
    return UserAuthModel.fromSupabaseUser(user);
  }

  //إنشاء حساب
  Future<UserAuthModel> signUp({
    required String email,
    required String password,
    Map<String, dynamic>? userMetadata, // مثل name، phone
  }) async {
    final response = await _client.auth.signUp(
      email: email.trim(),
      password: password.trim(),
      data: userMetadata,
    );

    final user = response.user;
    final session = response.session;

    if (user == null || session == null) {
      throw Exception('فشل في إنشاء الحساب أو تسجيل الدخول.');
      
    }

    return UserAuthModel.fromSupabaseUser(user);
  }

  /// تسجيل خروج المستخدم
  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  /// تحديث البريد أو الرقم
  Future<void> updateEmailOrPhone({String? email, String? phone}) async {
    await _client.auth.updateUser(
      UserAttributes(
        email: email,
        phone: phone,
      ),
    );
  }

  /// حذف الحساب
  Future<void> deleteUser() async {
    await _client.auth.admin.deleteUser(_client.auth.currentUser!.id);
  }
}
