import 'package:get/get.dart';
import 'package:hirfi_home/data/model/auth/craftsman_model.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_fetch_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MapsController extends GetxController {
  final SupabaseFetchService fetchService;
  MapsController(this.fetchService);

  var craftsman = <Craftsman>[].obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCraftsmen();
  }

  Future<void> fetchCraftsmen() async {
    try {
      final response = await Supabase.instance.client
          .from('craftsman')
          .select(
              'craftman_id, name, email, phone_number, picture, occupation_type, about_me, costumer_count, experience_years, rating, reviews_count, address, created_at, is_approved, city, street, day_of_week, start_time, end_time')
          .eq('is_approved', true);

      print('📦 Craftsmen response: $response');

      craftsman.value =
          (response as List).map((item) => Craftsman.fromMap(item)).toList();
    } catch (e) {
      print('Error loading craftsmen: $e');
    }
  }
}
