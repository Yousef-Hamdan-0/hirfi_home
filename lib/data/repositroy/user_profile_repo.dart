// lib/data/repositories/user_profile_repository.dart

import 'package:hirfi_home/data/model/auth/user_profile.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_fetch_service.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_send_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserProfileRepository {
  final SupabaseFetchService _fetchService;
  final SupabaseSendService _sendService;

  UserProfileRepository(this._fetchService, this._sendService);

  /// جلب بيانات البروفايل باستخدام ID من auth.users
  Future<UserProfile?> getProfile() async {
    try {
      final uid = _fetchService.userIdOrThrow;

      final result = await _fetchService.fetchSingle(
        'user_profile',
        UserProfile.columns, // استخدام getter بدلاً من دالة
        'id',
        uid,
      );

      return result != null
          ? UserProfile.fromMap({...result, 'id': uid})
          : null;
    } catch (e) {
      print('Error fetching profile: $e');
      throw Exception('Failed to load profile');
    }
  }

  Future<void> insertProfile(UserProfile profile) async {
    final uid = _sendService.userId;
    if (uid == null) throw Exception("User not authenticated");

    try {
      final inserted = await Supabase.instance.client
          .from('user_profile')
          .insert({
            'id': uid,
            'name': profile.name,
            'email': profile.email,
            'phone_number': profile.phoneNumber,
            'profile_picture': profile.profilePicture,
            'date_of_birth': profile.dateOfBirth,
            'gender': profile.gender,
          })
          .select()
          .maybeSingle();

      if (inserted == null) {
        throw Exception('فشل في إدخال بيانات البروفايل');
      }
    } catch (e) {
      print('Insert Profile Error: $e');
      rethrow;
    }
  }

  /// إدخال أو تحديث البروفايل حسب وجود المستخدم
  Future<void> updateOrInsertProfile(UserProfile profile) async {
    final uid = _sendService.userId;
    if (uid == null) return;

    try {
      final existing = await _fetchService.fetchSingle(
        'user_profile',
        ['id'],
        'id',
        uid,
      );

      if (existing != null) {
        // تحديث البيانات
        final updated = await Supabase.instance.client
            .from('user_profile')
            .update({
              'name': profile.name,
              'email': profile.email,
              'phone_number': profile.phoneNumber,
            })
            .eq('id', uid)
            .select()
            .maybeSingle();

        if (updated == null) {
          throw Exception('فشل في تحديث البيانات');
        }
      } else {
        // إدراج البيانات
        final inserted = await Supabase.instance.client
            .from('user_profile')
            .insert({
              'id': uid,
              'name': profile.name,
              'email': profile.email,
              'phone_number': profile.phoneNumber,
            })
            .select()
            .maybeSingle();

        if (inserted == null) {
          throw Exception('فشل في إدخال البيانات');
        }
      }
    } catch (e) {
      print('Insert/Update error: $e');
      rethrow;
    }
  }
}
