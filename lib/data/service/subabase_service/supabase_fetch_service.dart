import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseFetchService {
  final _client = Supabase.instance.client;
  SupabaseClient get client => _client;
  String get userIdOrThrow {
    final id = _client.auth.currentUser?.id;
    if (id == null) throw Exception('User not logged in');
    return id;
  }

  Future<Map<String, dynamic>?> fetchSingle(
    String table,
    List<String> columns,
    String whereKey,
    dynamic whereValue,
  ) async {
    try {
      final response = await _client
          .from(table)
          .select(columns.join(', '))
          .eq(whereKey, whereValue)
          .maybeSingle();

      return response;
    } catch (e) {
      debugPrint('Error fetching data: $e');
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> fetchList(
    String table,
    List<String> columns,
    String s,
    String craftsmanId, {
    Map<String, dynamic>? filters,
    Map<String, dynamic>? rangeFilters,
  }) async {
    var query = _client.from(table).select(columns.join(', '));

    filters?.forEach((key, value) {
      query = query.eq(key, value);
    });

    rangeFilters?.forEach((key, value) {
      if (value is Map) {
        value.forEach((op, val) {
          switch (op) {
            case 'gt':
              query = query.gt(key, val);
              break;
            case 'lt':
              query = query.lt(key, val);
              break;
          }
        });
      }
    });

    final response = await query;
    return response;
  }

  Future<String> fetchUserRole(String userId) async {
    final response = await Supabase.instance.client
        .from('app_users')
        .select('role')
        .eq('id', userId)
        .single();

    return response['role'];
  }

  Future<Map<String, dynamic>> getAppUser(String userId) async {
    return await Supabase.instance.client
        .from('app_users')
        .select()
        .eq('id', userId)
        .single();
  }
}
