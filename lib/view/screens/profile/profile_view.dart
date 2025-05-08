import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/app_icon.dart';
import 'package:hirfi_home/util/routes/routes_string.dart';
import 'package:hirfi_home/view/screens/profile/profile_controller.dart';
import 'package:hirfi_home/view/widget/primary_appbar/primary_appbar.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
        appBar: PrimaryAppbar(
      onTap: () {
        Get.toNamed(RoutesString.settings);
      },
      imageIcon: Image.asset(AppIcon.setting),
      title: TranslationData.profile.tr,
    ));
  }
}
