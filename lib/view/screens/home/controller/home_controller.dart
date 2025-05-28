import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/data/model/auth/craftsman_model.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_fetch_service.dart';
import 'package:hirfi_home/util/images.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController {
  // Current selected banner index
  var currentBannerIndex = 0.obs;
  final PageController pageController = PageController(initialPage: 0);

  // Current selected bottom navigation index
  var currentIndex = 0.obs;

  final fetchService = SupabaseFetchService();
  var craftsman = <Craftsman>[].obs;

  // List of banner items (can be extended with actual data)
  final List<Map<String, dynamic>> bannerItems = [
    {
      'titleLine1': 'Looking for',
      'titleLine2': 'Specialist Craftsmen?',
      'description':
          'Connect with elite skilled\ncraftsmen and get the best services!',
      'image': ImagesAssets.herfiaa,
    },
    {
      'titleLine1': 'Professional',
      'titleLine2': 'Home Services',
      'description': 'Get quality home services\nfrom trusted professionals',
      'image': ImagesAssets.aiImage2,
    },
    {
      'titleLine1': 'Urgent',
      'titleLine2': 'Repair Services',
      'description':
          'Fast & reliable repair services\nfor all your emergencies',
      'image': ImagesAssets.aiImage3,
    },
  ];

  // List of Jordanian governorates
  final List<String> governorates = [
    'Amman',
    'Irbid',
    'Zarqa',
    'Aqaba',
    'Mafraq',
    'Karak',
    'Tafilah',
    'Ma\'an',
    'Ajloun',
    'Jerash',
    'Balqa',
    'Madaba',
  ];

  // Selected governorate
  var selectedGovernorate = ''.obs;

  @override
  void onInit() {
    super.onInit();

    _loadGovernorate();
    fetchCraftsmen();
  }

  @override
  void onReady() {
    super.onReady();
    _startBannerTimer(); // ✅ تم نقله إلى هنا بعد التأكد من أن PageView مبني
  }

  @override
  void onClose() {
    pageController.dispose(); // ✅ تنظيف الـ PageController
    super.onClose();
  }

  Timer? _bannerTimer;
  // Auto-scroll banner
  void _startBannerTimer() {
    _bannerTimer?.cancel(); // تأكد من عدم تشغيل أكثر من واحد
    _bannerTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      int nextPage = (currentBannerIndex.value + 1) % bannerItems.length;
      changeBannerIndex(nextPage);
    });
  }

  void changeBannerIndex(int index) {
    currentBannerIndex.value = index;

    if (pageController.hasClients) {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      debugPrint('⚠️ PageController ليس مرتبطًا بعد بـ PageView');
    }
  }

  // Method to change bottom nav index
  void changeBanner(int index) {
    currentIndex.value = index;
    update();
  }

  // Method to handle category selection
  void onCategorySelected(String category) {
    // Handle category selection logic
    // Navigate to category details or filtered results
    // Get.to(() => CategoryDetailsView(category: category));
  }

  // Method to handle store selection
  void onStoreSelected(String store) {
    // Handle store selection logic
    // Navigate to store details
    // Get.to(() => StoreDetailsView(store: store));
  }

  // Method to handle search
  void onSearch(String query) {
    // Handle search logic
    // Navigate to search results
    // Get.to(() => SearchResultsView(query: query));
  }

  // Method to change location
  void changeLocation() {}

  // Load the selected governorate from SharedPreferences
  void _loadGovernorate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedGovernorate.value =
        prefs.getString('selectedGovernorate') ?? 'Amman';
  }

  // Save the selected governorate to SharedPreferences
  void saveGovernorate(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedGovernorate', value);
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
