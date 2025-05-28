import 'package:get/get.dart';
import 'package:hirfi_home/data/model/auth/craftsman_model.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_fetch_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FilteredCraftsmenController extends GetxController {
  final SupabaseFetchService fetchService;
  FilteredCraftsmenController(this.fetchService);

  final RxList<Craftsman> filteredCraftsmen = <Craftsman>[].obs;
  final RxBool isLoading = false.obs;
  final RxString? errorMessage = RxString('');
  var craftsman = <Craftsman>[].obs;
  final RxString currentOccupationKey = ''.obs;

  @override
  void onInit() {
    super.onInit();
    final occupationKey = Get.arguments as String?;
    if (occupationKey != null) {
      fetchCraftsmenByOccupation(occupationKey);
    }
    // fetchCraftsmen();
  }

  Future<void> fetchCraftsmenByOccupation(String occupationKey) async {
    currentOccupationKey.value = occupationKey;

    try {
      isLoading.value = true;

      final response = await fetchService.client
          .from('craftsman')
          .select(
            'craftman_id, name, email, phone_number, picture, occupation_type, about_me, costumer_count, experience_years, rating, reviews_count, address, created_at, is_approved, city, street, day_of_week, start_time, end_time',
          )
          .eq('occupation_type', occupationKey)
          .eq('is_approved', true);

      filteredCraftsmen.value =
          (response as List).map((item) => Craftsman.fromMap(item)).toList();
    } catch (e) {
      errorMessage?.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // Future<void> fetchCraftsmen() async {
  //   try {
  //     isLoading.value = true;
  //     final response = await fetchService.client
  //         .from('craftsman')
  //         .select(
  //             'craftman_id, name, email, phone_number, picture, occupation_type, about_me, costumer_count, experience_years, rating, reviews_count, address, created_at, is_approved, city, street, day_of_week, start_time, end_time')
  //         .or('occupation_type.eq.كهربجي,occupation_type.eq.electrician');

  //     filteredCraftsmen.value =
  //         (response as List).map((item) => Craftsman.fromMap(item)).toList();
  //   } catch (e) {
  //     errorMessage?.value = e.toString();
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  Future<void> fetchCraftsmen1() async {
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
