import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/app_icon.dart';
import 'package:hirfi_home/view/screens/create_profile/create_profile_controller.dart';
import 'package:hirfi_home/view/widget/primary_appbar/primary_appbar.dart';
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
                        color: AppColors.grey,
                        shape: BoxShape.circle,
                        image: controller.selectedImage.value != null
                            ? DecorationImage(
                                image:
                                    FileImage(controller.selectedImage.value!),
                                fit: BoxFit.cover,
                              )
                            : null,
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
              Container(
                child: TextFormField(
                  enabled: false,
                  cursorWidth: MediaQuery.sizeOf(context).width,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
