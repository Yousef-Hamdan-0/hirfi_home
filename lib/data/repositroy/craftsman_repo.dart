import 'package:flutter/material.dart';
import 'package:hirfi_home/data/model/auth/craftsman_model.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_fetch_service.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_send_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CraftsmanRepository {
  final SupabaseFetchService _fetchService;
  final SupabaseSendService _sendService;

  CraftsmanRepository(this._fetchService, this._sendService);

  /// جلب بيانات الحرفي الحالي
  Future<Craftsman?> getCurrentCraftsman() async {
    try {
      final uid = _fetchService.userIdOrThrow;

      final result = await _fetchService.fetchSingle(
        'craftsman',
        Craftsman.columns,
        'craftman_id',
        uid,
      );

      return result != null
          ? Craftsman.fromMap({...result, 'craftman_id': uid})
          : null;
    } catch (e) {
      debugPrint('Error fetching craftsman: $e');
      throw Exception('Failed to load craftsman');
    }
  }

  /// إدخال حرفي جديد
  Future<void> insertCraftsman(Craftsman craftsman) async {
    final uid = _sendService.userId;
    if (uid == null) throw Exception("User not authenticated");

    try {
      final inserted = await Supabase.instance.client
          .from('craftsman')
          .insert(craftsman.toMap())
          .select()
          .maybeSingle();

      if (inserted == null) {
        throw Exception('فشل في إدخال بيانات الحرفي');
      }
    } catch (e) {
      debugPrint('Insert Craftsman Error: $e');
      rethrow;
    }
  }

  /// تحديث أو إدخال بيانات الحرفي
  Future<void> updateOrInsertCraftsman(Craftsman craftsman) async {
    final uid = _sendService.userId;
    if (uid == null) return;

    try {
      final existing = await _fetchService.fetchSingle(
        'craftsman',
        ['craftman_id'],
        'craftman_id',
        uid,
      );

      if (existing != null) {
        await _sendService.update(
          'craftsman',
          craftsman.toMap(),
          'craftman_id',
          uid,
        );
      } else {
        await _sendService.insert('craftsman', craftsman.toMap());
      }
    } catch (e) {
      debugPrint('Insert/Update Craftsman Error: $e');
      rethrow;
    }
  }

  /// حذف الحرفي
  Future<void> deleteCraftsman(String craftmanId) async {
    await _sendService.delete('craftsman', 'craftman_id', craftmanId);
  }

  /// تحديث معلومات جزئية مثل الصورة أو نبذة
  Future<void> updateAdditionalInfo({
    required String craftmanId,
    String? picture,
    String? aboutMe,
    String? occupationType,
    String? address,
    bool? isApproved,
  }) async {
    final data = <String, dynamic>{};

    if (picture != null) data['picture'] = picture;
    if (aboutMe != null) data['about_me'] = aboutMe;
    if (occupationType != null) data['occupation_type'] = occupationType;
    if (address != null) data['address'] = address;
    if (isApproved != null) data['is_approved'] = isApproved;

    if (data.isEmpty) return;

    try {
      await _sendService.update('craftsman', data, 'craftman_id', craftmanId);
    } catch (e) {
      debugPrint('❌ Failed to update craftsman info: $e');
      rethrow;
    }
  }

  Future<Craftsman?> getCraftsman() async {
    try {
      final uid = _fetchService.userIdOrThrow;

      final result = await _fetchService.fetchSingle(
        'craftsman',
        Craftsman.columns,
        'craftman_id',
        uid,
      );

      return result != null
          ? Craftsman.fromMap({...result, 'craftman_id': uid})
          : null;
    } catch (e) {
      debugPrint('Error fetching craftsman: $e');
      throw Exception('Failed to load craftsman');
    }
  }
}
