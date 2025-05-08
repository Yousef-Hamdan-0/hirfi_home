import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/view/screens/settings/settings_controller.dart';
import 'package:hirfi_home/view/widget/line/line.dart';
import 'package:hirfi_home/view/widget/primary_button/primary_button.dart';
import 'package:hirfi_home/view/widget/text/body_text1.dart';
import 'package:hirfi_home/view/widget/text/headline4.dart';

class LogoutWidget extends GetView<SettingsController> {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Headline4(
              title: TranslationData.logOut.tr,
              fontSize: Get.locale!.languageCode == 'ar' ? 22 : 20,
            ),
            SizedBox(
              height: 8,
            ),
            Line(),
            SizedBox(
              height: 8,
            ),
            BodyText1(
              title: TranslationData.sureLogOut.tr,
              fontSize: Get.locale!.languageCode == 'ar' ? 16 : 18,
              color: AppColors.lightGrey,
            ),
            SizedBox(
              height: 24,
            ),
            PrimaryButton(
              onTap: () {
                controller.signOutUser();
              },
              title: TranslationData.YesLogout.tr,
              backgroundColor: AppColors.red,
            )
          ],
        ),
      ),
    );
  }
}
