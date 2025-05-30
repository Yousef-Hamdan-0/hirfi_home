import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/images.dart';
import 'package:hirfi_home/util/routes/routes_string.dart';
import 'package:hirfi_home/util/tools/tools.dart';
import 'package:hirfi_home/view/screens/welcome/welcome_controller.dart';
import 'package:hirfi_home/view/widget/setting_widgets/change_language.dart';
import 'package:hirfi_home/view/widget/primary_appbar/primary_appbar.dart';
import 'package:hirfi_home/view/widget/primary_appbar/primary_icon_button.dart';
import 'package:hirfi_home/view/widget/primary_button/primary_button.dart';
import 'package:hirfi_home/view/widget/text/body_text2.dart';
import 'package:hirfi_home/view/widget/text/headline4.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppbar(
          onTap: () {},
          backgroundColor: AppColors.almostBlack,
          child: PrimaryIconButton(
            onTap: () {
              appTools.showCustomBottomSheet(
                context,
                const ChangeLanguage(),
                true,
              );
            },
            icon: Icons.language,
            color: AppColors.white,
            iconSize: 32,
          )),
      backgroundColor: AppColors.almostBlack,
      body: Column(
        children: [
          Expanded(
            child: Image.asset(ImagesAssets.darkModeLogo),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              padding:
                  EdgeInsets.only(top: 24, right: 24, left: 24, bottom: 24),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Headline4(
                    title: TranslationData.welcome.tr,
                    fontSize: Get.locale!.languageCode == 'ar' ? 20 : 18,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  BodyText2(
                    title: TranslationData.welcomeExplanation.tr,
                    maxLines: 2,
                    color: AppColors.darkGrey,
                    fontSize: Get.locale!.languageCode == 'ar' ? 16 : 14,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  PrimaryButton(
                    onTap: () {
                      Get.toNamed(RoutesString.login);
                    },
                    title: TranslationData.loginViaEmail.tr,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  PrimaryButton(
                    onTap: () {
                      controller.selectedRole = 'user';
                      Get.toNamed(RoutesString.signUpUser,
                          arguments: controller.selectedRole);
                    },
                    title: TranslationData.iDontHaveAnAccount.tr,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BodyText2(
                        title: TranslationData.areYouACraftsman.tr,
                        color: AppColors.lightGrey,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      InkWell(
                        onTap: () {
                          controller.selectedRole = 'craftsman';
                          Get.toNamed(RoutesString.signUpUser,
                              arguments: controller.selectedRole);
                        },
                        child: BodyText2(
                          title: TranslationData.iAmACraftsman.tr,
                          color: AppColors.textButton,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
