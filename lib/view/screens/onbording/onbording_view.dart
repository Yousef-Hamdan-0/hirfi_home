import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/routes/routes_string.dart';
import 'package:hirfi_home/util/tools/tools.dart';
import 'package:hirfi_home/view/screens/onbording/onbording_controller.dart';
import 'package:hirfi_home/view/screens/onbording/widget/intro_page_1.dart';
import 'package:hirfi_home/view/screens/onbording/widget/intro_page_2.dart';
import 'package:hirfi_home/view/screens/onbording/widget/intro_page_3.dart';
import 'package:hirfi_home/view/widget/setting_widgets/change_language.dart';
import 'package:hirfi_home/view/widget/primary_appbar/change_language_icon_button.dart';
import 'package:hirfi_home/view/widget/primary_button/primary_button.dart';
import 'package:hirfi_home/view/widget/primary_taxt_button/primary_taxt_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbordingView extends GetView<OnbordingController> {
  const OnbordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView(
                  controller: controller.pageController,
                  onPageChanged: (index) =>
                      controller.onLastPage.value = (index == 2),
                  children: [IntroPage1(), IntroPage2(), IntroPage3()],
                ),
                Padding(
                    padding: EdgeInsets.only(top: 32, left: 24, right: 24),
                    child: ChangeLanguageIconButton(onTap: () {
                      appTools.showCustomBottomSheet(
                        context,
                        const ChangeLanguage(),
                        true,
                      );
                    }))
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 50),
            child: Column(
              children: [
                PrimaryButton(
                    onTap: () {
                      controller.pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    },
                    title: TranslationData.next.tr),
                SizedBox(
                  height: 18,
                ),
                SmoothPageIndicator(
                  controller: controller.pageController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: AppColors.headLineText,
                    dotColor: AppColors.hintText,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                PrimaryTaxtButton(
                  onTap: () {
                    Get.offAllNamed(RoutesString.welcomeScreen);
                  },
                  title: TranslationData.skip.tr,
                  color: AppColors.darkGrey,
                  fontSize: Get.locale!.languageCode == 'ar' ? 16 : 14,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
