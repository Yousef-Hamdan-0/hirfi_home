import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/images.dart';
import 'package:hirfi_home/util/routes/routes_string.dart';
import 'package:hirfi_home/util/tools/tools.dart';
import 'package:hirfi_home/view/screens/welcome/welcome_controller.dart';
import 'package:hirfi_home/view/widget/change_language.dart';
import 'package:hirfi_home/view/widget/primary_appbar/primary_appbar.dart';
import 'package:hirfi_home/view/widget/primary_appbar/primary_icon_button.dart';
import 'package:hirfi_home/view/widget/primary_button/primary_button.dart';
import 'package:hirfi_home/view/widget/text/body_text2.dart';
import 'package:hirfi_home/view/widget/text/headline4.dart';

class WelcomeViwe extends GetView<WelcomeController> {
  const WelcomeViwe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppbar(
<<<<<<< HEAD
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
=======
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
        ),
      ),
      backgroundColor: AppColors.almostBlack,
      body: Column(
        children: [
          Expanded(child: Image.asset(ImagesAssets.darkModeLogo)),
>>>>>>> f804626c1a0da5cfccb909dc35e6c76c18ebb8a1
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).width * 0.75,
              padding: EdgeInsets.only(top: 28, right: 24, left: 24),
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
<<<<<<< HEAD
                  SizedBox(
                    height: 12,
                  ),
=======
                  SizedBox(height: 12),
>>>>>>> f804626c1a0da5cfccb909dc35e6c76c18ebb8a1
                  BodyText2(
                    title: TranslationData.welcomeExplanation.tr,
                    maxLines: 2,
                    color: AppColors.darkGrey,
                    fontSize: Get.locale!.languageCode == 'ar' ? 16 : 14,
                  ),
<<<<<<< HEAD
                  SizedBox(
                    height: 30,
                  ),
=======
                  SizedBox(height: 30),
>>>>>>> f804626c1a0da5cfccb909dc35e6c76c18ebb8a1
                  PrimaryButton(
                    onTap: () {
                      Get.toNamed(RoutesString.login);
                    },
                    title: TranslationData.loginViaEmail.tr,
                  ),
<<<<<<< HEAD
                  SizedBox(
                    height: 24,
                  ),
=======
                  SizedBox(height: 24),
>>>>>>> f804626c1a0da5cfccb909dc35e6c76c18ebb8a1
                  PrimaryButton(
                    onTap: () {
                      Get.toNamed(RoutesString.signUpUser);
                    },
                    title: TranslationData.iDontHaveAnAccount.tr,
                  ),
<<<<<<< HEAD
                  SizedBox(
                    height: 24,
                  ),
=======
                  SizedBox(height: 24),
>>>>>>> f804626c1a0da5cfccb909dc35e6c76c18ebb8a1
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BodyText2(
                        title: TranslationData.areYouACraftsman.tr,
                        color: AppColors.lightGrey,
                      ),
<<<<<<< HEAD
                      SizedBox(
                        width: 4,
                      ),
=======
                      SizedBox(width: 4),
>>>>>>> f804626c1a0da5cfccb909dc35e6c76c18ebb8a1
                      InkWell(
                        onTap: () {
                          Get.toNamed(RoutesString.signUpCraftman);
                        },
                        child: BodyText2(
                          title: TranslationData.iAmACraftsman.tr,
                          color: AppColors.textButton,
                          fontSize: 14,
                        ),
<<<<<<< HEAD
                      )
                    ],
                  )
                ],
              ),
            ),
          )
=======
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
>>>>>>> f804626c1a0da5cfccb909dc35e6c76c18ebb8a1
        ],
      ),
    );
  }
}
