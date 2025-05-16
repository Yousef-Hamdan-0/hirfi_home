import 'dart:io';

import 'package:dropdown_model_list/drop_down/model.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hirfi_home/data/repositroy/craftsman_repo.dart';
import 'package:hirfi_home/data/repositroy/user_profile_repo.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class createCraftsmanProfileController extends GetxController {
  final GlobalKey<FormState> CreateCraftmanProfileForm = GlobalKey<FormState>();
  final dropDownKey = GlobalKey<DropdownSearchState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController apaaboutMe = TextEditingController();
  final CraftsmanRepository repository; // ✅ استخدم final هنا
  createCraftsmanProfileController(this.repository);
  final Rx<File?> selectedImage = Rx<File?>(null);
  RxString uploadedImageUrl = ''.obs;
  RxString name = ''.obs;
  final RxString startTime = ''.obs;
  final RxString endTime = ''.obs;
  RxList<String> selectedDays = <String>[].obs;
  Rx<LatLng?> selectedLocation = Rx<LatLng?>(null);
  

  Future<void> fetchAndStoreUserInfo() async {
    try {
      final profile = await repository.getCraftsman();
      if (profile != null) {
        print('Name: ${profile.name}');
        name.value = profile.name;
      } else {
        print('No profile found.');
      }
    } catch (e) {
      print('Failed to fetch basic info: $e');
    }
  }

  final occupationLabels = [
    TranslationData.mechanic.tr,
    TranslationData.plumber.tr,
    TranslationData.electrician.tr,
    TranslationData.blacksmith.tr,
    TranslationData.carpenter.tr,
    TranslationData.builder.tr
  ];

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

  RxString selected = ''.obs;

  @override
  void onInit() {
    super.onInit();
    dayItems =
        daysList.map((label) => MultiSelectItem<String>(label, label)).toList();
  }

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      selectedImage.value = File(picked.path);
    }
  }

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
      return '$firstDay - $lastDay، $startTime - $endTime';
    }

    // لو مش متصلة
    final translatedDays = sortedDays.map((d) => d.tr).join(', ');
    return '$translatedDays، $startTime - $endTime';
  }
}
