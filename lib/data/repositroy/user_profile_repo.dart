// lib/data/repositories/user_profile_repository.dart

import 'package:flutter/material.dart';
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
    try {
      final inserted = await Supabase.instance.client
          .from('user_profile')
          .insert({
            'id': profile.id, // استخدم id القادم من كائن UserProfile
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
      } else {
        print("✅ تم إدراج user_profile بنجاح: ${profile.id}");
      }
    } catch (e) {
      print('❌ Insert Profile Error: $e');
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
      debugPrint('Insert Profile Error: $e');
      rethrow;
    }
  }

  Future<void> deleteProfile(String userId) async {
    await _sendService.delete('user_profile', 'id', userId);
  }

  Future<void> updateAdditionalInfo({
    required String userId,
    String? profilePicture,
    String? dateOfBirth,
    String? gender,
  }) async {
    final data = <String, dynamic>{};

    if (profilePicture != null) data['profile_picture'] = profilePicture;
    if (dateOfBirth != null) data['date_of_birth'] = dateOfBirth;
    if (gender != null) data['gender'] = gender;

    if (data.isEmpty) return;

    try {
      await _sendService.update('user_profile', data, 'id', userId);
    } catch (e) {
      debugPrint('❌ Failed to update additional info: $e');
      rethrow;
    }
  }
}
