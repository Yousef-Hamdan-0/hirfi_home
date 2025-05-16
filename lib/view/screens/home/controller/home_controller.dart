import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/util/images.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  // Current selected banner index
  var currentBannerIndex = 0.obs;
  late PageController pageController;

  // Current selected bottom navigation index
  var currentIndex = 0.obs;
  
  // List of banner items (can be extended with actual data)
  final List<Map<String, dynamic>> bannerItems = [
    {
      'titleLine1': 'Looking for',
      'titleLine2': 'Specialist Craftsmen?',
      'description': 'Connect with elite skilled\ncraftsmen and get the best services!',
      'image': ImagesAssets.aiImage1,
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
      'description': 'Fast & reliable repair services\nfor all your emergencies',
      'image': ImagesAssets.aiImage3,
    },
  ];  final List<Map<String, String>> stores = [
    {
      'imageUrl': ImagesAssets.aiImage1,
      'name': 'الريس لصيانة الأجهزة المنزلية',
    },
    {
      'imageUrl': ImagesAssets.aiImage1,
      'name': 'مواد وأدوات معتمد',
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
    pageController = PageController(initialPage: 0);
    _loadGovernorate();
    _startBannerTimer();
  }
  
  // Auto-scroll banner
  void _startBannerTimer() {
    Future.delayed(const Duration(seconds: 5), () {
      int nextPage = (currentBannerIndex.value + 1) % bannerItems.length;
      changeBannerIndex(nextPage);
      _startBannerTimer();
    });
  }

  void changeBannerIndex(int index) {
    currentBannerIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
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
  void changeLocation() {
  
  }
  
  // Load the selected governorate from SharedPreferences
  void _loadGovernorate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedGovernorate.value = prefs.getString('selectedGovernorate') ?? 'Amman';
  }
  
  // Save the selected governorate to SharedPreferences
  void saveGovernorate(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedGovernorate', value);
  }
}