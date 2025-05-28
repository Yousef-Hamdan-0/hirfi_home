// lib/data/repositories/auth_user_repository.dart

import 'package:get_storage/get_storage.dart';
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

  Future<UserAuthModel> signIn({
    required String email,
    required String password,
  }) async {
    final response = await Supabase.instance.client.auth.signInWithPassword(
      email: email.trim(),
      password: password.trim(),
    );

    final user = response.user;
    final session = response.session;

    if (user == null || session == null) {
      throw Exception('فشل تسجيل الدخول، تحقق من البيانات');
    }

    // ✅ حفظ التوكن في GetStorage
    final box = GetStorage();
    await box.write('access_token', session.accessToken);
    await box.write('refresh_token', session.refreshToken);

    return UserAuthModel.fromSupabaseUser(user);
  }

  //إنشاء حساب
  Future<UserAuthModel> signUp({
    required String email,
    required String password,
    Map<String, dynamic>? userMetadata,
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

    // ✅ حفظ التوكنات
    final box = GetStorage();
    await box.write('access_token', session.accessToken);
    await box.write('refresh_token', session.refreshToken);

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
