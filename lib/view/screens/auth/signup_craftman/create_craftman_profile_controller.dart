import 'dart:io';

import 'package:dropdown_model_list/drop_down/model.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hirfi_home/data/model/workinghours_model.dart';
import 'package:hirfi_home/data/repositroy/craftsman_repo.dart';

import 'package:hirfi_home/data/service/subabase_service/supabase_fetch_service.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_send_service.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/util/routes/routes_string.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class createCraftsmanProfileController extends GetxController {
  late final CraftsmanRepository _craftsmanRepository;

  final SupabaseFetchService _fetchService = SupabaseFetchService();
  final SupabaseSendService _sendService = SupabaseSendService();
  final GlobalKey<FormState> CreateCraftmanProfileForm = GlobalKey<FormState>();
  final dropDownKey = GlobalKey<DropdownSearchState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController aboutMe = TextEditingController();
  final CraftsmanRepository repository; // ✅ استخدم final هنا
  createCraftsmanProfileController(this.repository);

  RxString name = ''.obs;

  Rx<LatLng?> selectedLocation = Rx<LatLng?>(null);
  RxString city = ''.obs;
  RxString street = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAndStoreCraftsmanInfo();

    dayItems =
        daysList.map((label) => MultiSelectItem<String>(label, label)).toList();
    _craftsmanRepository = CraftsmanRepository(_fetchService, _sendService);
  }

  Future<void> fetchAndStoreCraftsmanInfo() async {
    try {
      final craftsman = await repository.getCraftsmanProfile();
      if (craftsman != null) {
        print('Name: ${craftsman.name}');
        name.value = craftsman.name;
      } else {
        print('No craftsman profile found.');
      }
    } catch (e) {
      print('Failed to fetch craftsman info: $e');
    }
  }

// occupation
  final occupationOptions =
      TranslationData.occupationTypesMap.entries.toList().obs;

  final RxString selectedOccupationKey = ''.obs;
// Days
  RxList<String> selectedDays = <String>[].obs;

  final List<String> daysList = [
    TranslationData.allDays.tr,
    TranslationData.sunday.tr,
    TranslationData.monday.tr,
    TranslationData.tuesday.tr,
    TranslationData.wednesday.tr,
    TranslationData.thursday.tr,
    TranslationData.friday.tr,
    TranslationData.saturday.tr,
  ];

  //hours
  final RxString startTime = ''.obs;
  final RxString endTime = ''.obs;

  final List<String> hours = [
    "00:00",
    "01:00",
    "02:00",
    "03:00",
    "04:00",
    "05:00",
    "06:00",
    "07:00",
    "08:00",
    "09:00",
    "10:00",
    "11:00",
    "12:00"
  ];
  var selectedOption = OptionItem(title: "00:00").obs;

  late final List<MultiSelectItem<String>> dayItems;

  @override
  final Rx<File?> selectedImage = Rx<File?>(null);
  RxString uploadedImageUrl = ''.obs;
  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      selectedImage.value = File(picked.path);
    }
  }

  RxString workingDaysText = ''.obs;
  String getWorkingTimeText({
    required List<String> selectedDays,
    required String startTime,
    required String endTime,
  }) {
    final dayOrder = [
      TranslationData.sunday.tr,
      TranslationData.monday.tr,
      TranslationData.tuesday.tr,
      TranslationData.wednesday.tr,
      TranslationData.thursday.tr,
      TranslationData.friday.tr,
      TranslationData.saturday.tr
    ];

    // كل الأيام
    if (selectedDays.length == 7) {
      workingDaysText.value = TranslationData.allDays.tr;
      return '${TranslationData.allDays.tr}, $startTime - $endTime';
    }

    // ترتيب الأيام حسب القائمة الأصلية
    final sortedDays = selectedDays.toList()
      ..sort((a, b) => dayOrder.indexOf(a).compareTo(dayOrder.indexOf(b)));

    // تحقق من الاتصال
    bool isConsecutive = true;
    for (int i = 0; i < sortedDays.length - 1; i++) {
      final currentIndex = dayOrder.indexOf(sortedDays[i]);
      final nextIndex = dayOrder.indexOf(sortedDays[i + 1]);
      if (nextIndex - currentIndex != 1) {
        isConsecutive = false;
        break;
      }
    }

    if (isConsecutive && sortedDays.length > 1) {
      final firstDay = sortedDays.first.tr;
      final lastDay = sortedDays.last.tr;
      workingDaysText.value = '$firstDay - $lastDay';
      return '$firstDay - $lastDay، $startTime - $endTime';
    }

    // لو مش متصلة
    final translatedDays = sortedDays.map((d) => d.tr).join(', ');
    workingDaysText.value = translatedDays;
    return '$translatedDays، $startTime - $endTime';
  }

  Future<void> signOutUser() async {
    try {
      // 1. تسجيل خروج من Supabase
      await Supabase.instance.client.auth.signOut();

      // 2. حذف أي بيانات مخزنة محليًا (مثل access_token)
      await GetStorage().erase();
      // 3. الانتقال إلى صفحة تسجيل الدخول أو البداية
      Get.offAllNamed(RoutesString
          .welcomeScreen); // أو RoutesString.login إذا كنت تستخدم Route Manager

      print('✅ تم تسجيل الخروج بنجاح');
    } catch (e) {
      print('❌ فشل تسجيل الخروج: $e');
      Get.snackbar('خطأ', 'حدث خطأ أثناء تسجيل الخروج');
    }
  }

  Future<void> completeCraftsmanProfile() async {
    final userId = _getUserIdOrThrow();
    final imageUrl = await _getProfileImageUrl(userId);
    final location = _getLocationOrThrow();

    await fetchCityAndStreetFromCoordinates(location);
    await _updateCraftsmanData(userId, imageUrl, location);

    debugPrint("✅ تم استكمال بيانات الحرفي");
    final craftsman = await _craftsmanRepository.getCurrentCraftsman();
    if (craftsman != null && craftsman.isApproved == true) {
      debugPrint("✅ تم التحقق، الحرفي مفعل");
      Get.offAllNamed(RoutesString.mainShell);
    } else {
      Get.snackbar("بانتظار الموافقة", "سيتم تفعيل حسابك من قبل الإدارة قريبًا",
          snackPosition: SnackPosition.BOTTOM);
      signOutUser();
    }
  }

  Future<void> fetchCityAndStreetFromCoordinates(LatLng location) async {
    try {
      final placemarks = await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        street.value = place.street ?? '';
        city.value = place.locality ??
            place.administrativeArea ??
            place.subAdministrativeArea ??
            '';
      }
    } catch (e) {
      street.value = '';
      city.value = '';
    }
  }

  String _getUserIdOrThrow() {
    final userId = Supabase.instance.client.auth.currentUser?.id;
    if (userId == null) {
      throw Exception("❌ المستخدم غير مسجل الدخول");
    }
    return userId;
  }

  Future<String> _getProfileImageUrl(String userId) async {
    if (selectedImage.value != null) {
      final uploadedUrl = await _sendService.uploadFile(
        'craftsman-profile',
        'craftsmen/$userId.jpg',
        selectedImage.value!,
      );
      if (uploadedUrl == null) {
        throw Exception("❌ فشل في رفع الصورة");
      }
      return uploadedUrl;
    }

    return Supabase.instance.client.storage
        .from('craftsman-profile')
        .getPublicUrl('craftsmen/default.jpg');
  }

  LatLng _getLocationOrThrow() {
    final location = selectedLocation.value;
    if (location == null) {
      throw Exception("❌ لم يتم تحديد الموقع");
    }
    return location;
  }

  Future<void> _updateCraftsmanData(
      String userId, String imageUrl, LatLng location) async {
    await _craftsmanRepository.updateAdditionalInfo(
        craftmanId: userId,
        picture: imageUrl,
        aboutMe: aboutMe.text,
        occupationType: selectedOccupationKey.value,
        address: "${location.latitude},${location.longitude}",
        city: city.value,
        street: street.value,
        isApproved: false,
        dayOfWeek: workingDaysText.value,
        startTime: startTime.value,
        endTime: endTime.value);
  }
}
