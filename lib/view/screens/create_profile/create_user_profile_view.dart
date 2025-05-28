import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/app_icon.dart';
import 'package:hirfi_home/view/screens/create_profile/create_user_profile_controller.dart';
import 'package:hirfi_home/view/widget/primary_appbar/primary_appbar.dart';
import 'package:hirfi_home/view/widget/primary_button/primary_button.dart';
import 'package:hirfi_home/view/widget/text_field.dart';

class CreateUserProfileView extends GetView<CreateUserProfileController> {
  const CreateUserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppbar(
        onTap: () {},
        centerTitle: false,
        title: TranslationData.fillYourProfile.tr,
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  Obx(
                    () => Container(
                      width: MediaQuery.sizeOf(context).width * 0.45,
                      height: MediaQuery.sizeOf(context).width * 0.45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: controller.selectedImage.value == null
                            ? DecorationImage(
                                image: AssetImage(AppIcon.profileCircle),
                                fit: BoxFit.fill,
                              )
                            : DecorationImage(
                                image:
                                    FileImage(controller.selectedImage.value!),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    right: 8,
                    child: InkWell(
                      onTap: () {
                        controller.pickImageFromGallery();
                      },
                      child: Image.asset(AppIcon.imageEdit),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Obx(() => Column(
                    children: [
                      MainTextField(
                          controller: controller.nameController,
                          hint: controller.name.value,
                          enabled: false,
                          textInputType: TextInputType.none),
                      SizedBox(
                        height: 20,
                      ),
                      MainTextField(
                        controller: controller.nameController,
                        hint: controller.email.value,
                        enabled: false,
                        textInputType: TextInputType.none,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MainTextField(
                        controller: controller.nameController,
                        hint: controller.phoneNumber.value,
                        enabled: false,
                        textInputType: TextInputType.none,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () => controller.pickDate(context),
                        child: MainTextField(
                          controller: controller.nameController,
                          hint: controller.dateOfBirth.value,
                          hintColor: AppColors.almostBlack,
                          prefixIcon: Image.asset(AppIcon.calendar),
                          enabled: false,
                          textInputType: TextInputType.none,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DropdownButtonFormField2(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(8),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xffD1D5DB)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        hint: const Text("اختر مهنتك"),
                        value: controller.selected.value.isNotEmpty
                            ? controller.selected.value
                            : null,
                        items: controller.genderOptions.map((entry) {
                          return DropdownMenuItem<String>(
                            value: entry
                                .key, // المفتاح الإنجليزي الذي يُرسل لـ Supabase
                            child: Text(entry.value), // النص المترجم للمستخدم
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            controller.selected.value = value;
                          }
                        },
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      PrimaryButton(
                          onTap: () => controller.completeUserProfile(
                              dateOfBirth: controller.dateOfBirth.value,
                              gender: controller.selected.value),
                          title: TranslationData.createProfile.tr)
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
