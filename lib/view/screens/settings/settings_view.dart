import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/app_icon.dart';
import 'package:hirfi_home/util/tools/tools.dart';
import 'package:hirfi_home/view/screens/settings/settings_controller.dart';
import 'package:hirfi_home/view/widget/line/line.dart';
import 'package:hirfi_home/view/widget/primary_appbar/primary_appbar.dart';
import 'package:hirfi_home/view/widget/primary_button/primary_button.dart';
import 'package:hirfi_home/view/widget/primary_button/setting_primary_button.dart';
import 'package:hirfi_home/view/widget/setting_widgets/change_language.dart';
import 'package:hirfi_home/view/widget/setting_widgets/logout_widget.dart';
import 'package:hirfi_home/view/widget/text/body_text1.dart';
import 'package:hirfi_home/view/widget/text/headline4.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppbar(
        onTap: () {
          Get.back();
        },
        title: TranslationData.settings.tr,
        icon: Icons.arrow_back,
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsetsDirectional.only(start: 24, top: 32, end: 24),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 1,
          shrinkWrap: false,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SettingPrimaryButton(
                  onTap: () {},
                  title: TranslationData.personalDetails.tr,
                  image: Image.asset(AppIcon.personalDetails),
                ),
                Line(),
                SettingPrimaryButton(
                  onTap: () {},
                  title: TranslationData.changePassword.tr,
                  image: Image.asset(AppIcon.changePassword),
                ),
                Line(),
                SettingPrimaryButton(
                  onTap: () {},
                  title: TranslationData.notification.tr,
                  image: Image.asset(AppIcon.notification),
                ),
                Line(),
                SettingPrimaryButton(
                  onTap: () {},
                  title: TranslationData.darkMode.tr,
                  image: Image.asset(AppIcon.darkMode),
                ),
                Line(),
                SettingPrimaryButton(
                  onTap: () {
                    appTools.showCustomBottomSheet(
                      context,
                      const ChangeLanguage(),
                      true,
                    );
                  },
                  title: TranslationData.languages.tr,
                  image: Image.asset(AppIcon.languages),
                ),
                Line(),
                SettingPrimaryButton(
                  onTap: () {},
                  title: TranslationData.rateApp.tr,
                  image: Image.asset(AppIcon.rateApp),
                ),
                Line(),
                SettingPrimaryButton(
                  onTap: () {},
                  title: TranslationData.feedback.tr,
                  image: Image.asset(AppIcon.feedback),
                ),
                Line(),
                SettingPrimaryButton(
                  onTap: () {
                    appTools.showCustomBottomSheet(
                      context,
                      LogoutWidget(
                        child: Center(
                          child: Column(
                            children: [
                              Headline4(
                                title: TranslationData.logOut.tr,
                                fontSize:
                                    Get.locale!.languageCode == 'ar' ? 22 : 20,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Line(),
                              const SizedBox(
                                height: 8,
                              ),
                              BodyText1(
                                title: TranslationData.sureLogOut.tr,
                                fontSize:
                                    Get.locale!.languageCode == 'ar' ? 16 : 18,
                                color: AppColors.lightGrey,
                              ),
                              const SizedBox(
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
                      ),
                      true,
                    );
                  },
                  title: TranslationData.logout.tr,
                  titleColor: AppColors.red,
                  color: AppColors.red,
                  image: Image.asset(AppIcon.logout),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
