import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hirfi_home/data/model/auth/craftsman_model.dart';

class SearchApp {
  final SupabaseClient _client = Supabase.instance.client;

  Future<List<String>> getCraftsmanNames() async {
    try {
      final response = await _client.from('craftsman').select('name');

      final names = List<String>.from(response.map((e) => e['name']));
      return names;
    } catch (e) {
      print('❌ Exception in getCraftsmanNames: $e');
      return [];
    }
  }

  Future<List<Craftsman>> getCraftsmenByName(String? name) async {
    if (name == null || name.isEmpty) return [];

    try {
      final response = await _client
          .from('craftsman')
          .select()
          .ilike('name', '%$name%'); // ← بحث جزئي غير حساس لحالة الأحرف
      print('📦 نتائج البحث: ${response.length}');
      print('📦 البيانات: $response');
      final data =
          (response as List).map((item) => Craftsman.fromMap(item)).toList();

      return data;
    } catch (e) {
      print('❌ Exception in getCraftsmenByName: $e');
      return [];
    }
  }
}
