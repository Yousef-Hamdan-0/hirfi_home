import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

File? selectedImage;

class CreateProfileController extends GetxController {
  final GlobalKey<FormState> signUpForm = GlobalKey<FormState>();
  final Rx<File?> selectedImage = Rx<File?>(null);
  TextEditingController nameController = TextEditingController();
  Future<void> pickImageFromGallery() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      selectedImage.value = File(picked.path);
    }
  }
}
