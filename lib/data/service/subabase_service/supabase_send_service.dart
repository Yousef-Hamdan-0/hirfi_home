// lib/data/services/supabase_send_service.dart

import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseSendService {
  final _client = Supabase.instance.client;

  Future<void> insert(String table, Map<String, dynamic> data) async {
    await _client.from(table).insert(data);
  }

  Future<void> update(String table, Map<String, dynamic> data, String whereKey,
      dynamic whereValue) async {
    await _client.from(table).update(data).eq(whereKey, whereValue);
  }

  Future<int> delete(String table, String whereKey, dynamic whereValue) async {
    final response =
        await _client.from(table).delete().eq(whereKey, whereValue);
    return response.count ?? 0; // عدد الصفوف المحذوفة
  }

  Future<String?> uploadFile(String bucket, String path, File file) async {
    try {
      await _client.storage.from(bucket).upload(path, file);
      return _client.storage.from(bucket).getPublicUrl(path);
    } catch (e) {
      print('Error uploading file: $e');
      return null;
    }
  }

  String? get userId => _client.auth.currentUser?.id;
}
