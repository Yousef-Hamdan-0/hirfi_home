import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/app_icon.dart';
import 'package:hirfi_home/view/screens/create_profile/create_profile_controller.dart';
import 'package:hirfi_home/view/widget/main_dropdown_field.dart';
import 'package:hirfi_home/view/widget/primary_appbar/primary_appbar.dart';
import 'package:hirfi_home/view/widget/primary_button/primary_button.dart';
import 'package:hirfi_home/view/widget/text_field.dart';

class CreateProfileView extends GetView<CreateProfileController> {
  const CreateProfileView({super.key});

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
                      MainDropdownField<String>(
                        items: controller.gender,
                        selectedItem: controller.selected.value,
                        hint: 'الجنس',
                        onChanged: (value) {
                          controller.selected.value = value.toString();
                        },
                        validator: (value) {
                          if (value == null) return 'الرجاء اختيار الجنس';
                          return null;
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
