import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/data/repositroy/user_profile_repo.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_send_service.dart';
import 'package:hirfi_home/helper/date_converter.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/util/routes/routes_string.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

File? selectedImage;

class CreateUserProfileController extends GetxController {
  final UserProfileRepository repository; // ✅ استخدم final هنا
  CreateUserProfileController(this.repository);
  final GlobalKey<FormState> signUpForm = GlobalKey<FormState>();
  final Rx<File?> selectedImage = Rx<File?>(null);
  RxString uploadedImageUrl = ''.obs;
  TextEditingController nameController = TextEditingController();
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString phoneNumber = ''.obs;
  RxString dateOfBirth = TranslationData.dateOfBirth.tr.obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxString selected = ''.obs;
  final gender = [TranslationData.male.tr, TranslationData.female.tr].obs;
  @override
  void onInit() {
    super.onInit();
    fetchAndStoreUserInfo();
  }

  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      selectedImage.value = File(picked.path);
    }
  }

  Future<void> fetchAndStoreUserInfo() async {
    try {
      final profile = await repository.getProfile();
      if (profile != null) {
        print('Name: ${profile.name}');
        name.value = profile.name;
        print('Email: ${profile.email}');
        email.value = profile.email;
        print('Phone: ${profile.phoneNumber}');
        phoneNumber.value = profile.phoneNumber;
      } else {
        print('No profile found.');
      }
    } catch (e) {
      print('Failed to fetch basic info: $e');
    }
  }

  Future<void> pickDate(BuildContext context) async {
    final now = DateTime.now();
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1945),
      lastDate: DateTime(now.year, 12, 31), // ✅ نهاية السنة الحالية
    );

    if (selectedDate != null) {
      final dateOnly = DateConverter.dateToDate(selectedDate);
      dateOfBirth.value = dateOnly.toString();
      print('📅 تم اختيار: $selectedDate');
    }
  }

  Future<void> completeUserProfile({
    required String dateOfBirth,
    required String gender,
  }) async {
    final userId = Supabase.instance.client.auth.currentUser?.id;
    if (userId == null) {
      throw Exception("User not logged in");
    }

    final sendService = SupabaseSendService();

    // 🔹 رفع الصورة إذا كانت موجودة، وإلا استخدام صورة افتراضية
    String imageUrl;

    if (selectedImage.value != null) {
      final uploadedUrl = await sendService.uploadFile(
        'user-profile',
        'profiles/$userId.jpg',
        selectedImage.value!,
      );

      if (uploadedUrl == null) {
        throw Exception("❌ Failed to upload profile picture");
      }

      imageUrl = uploadedUrl;
    } else {
      imageUrl = Supabase.instance.client.storage
          .from('user-profile')
          .getPublicUrl('profiles/default.jpg');
    }

    // 🔹 تحديث البيانات
    await sendService.update(
      'user_profile',
      {
        'profile_picture': imageUrl,
        'date_of_birth': dateOfBirth,
        'gender': gender,
      },
      'id',
      userId,
    );

    debugPrint("✅ تم استكمال بيانات البروفايل");
    Get.offAllNamed(RoutesString.mainShell);
  }

  
}
