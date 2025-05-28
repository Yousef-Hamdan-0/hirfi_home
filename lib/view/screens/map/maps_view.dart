import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/fonts.dart';
import 'package:hirfi_home/util/tools/tools.dart';

import 'package:hirfi_home/view/screens/home/widget/craftsman_card3.dart';
import 'package:hirfi_home/view/screens/map/maps_controller.dart';

import 'package:hirfi_home/view/widget/line/line.dart';
import 'package:hirfi_home/view/widget/primary_button/primary_button.dart';
import 'package:hirfi_home/view/widget/setting_widgets/logout_widget.dart';
import 'package:hirfi_home/view/widget/text/body_text1.dart';
import 'package:hirfi_home/view/widget/text/headline4.dart';

class MapsView extends GetView<MapsController> {
  const MapsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          TranslationData.map.tr,
          style: TextStyle(
              fontFamily: Get.locale!.languageCode == "ar"
                  ? AppFonts.tajawalBold
                  : AppFonts.interSemiBold,
              fontSize: Get.locale!.languageCode == "ar" ? 22 : 20,
              color: AppColors.almostBlack),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 24, left: 24, top: 16),
        child: Obx(() {
          return Expanded(
            child: ListView.builder(
              itemCount: controller.craftsman.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final craftsman = controller.craftsman[index];
                return craftsmanCard3(
                    onTap: () {
                      appTools.showCustomBottomSheet(
                        context,
                        LogoutWidget(
                          child: Center(
                            child: Column(
                              children: [
                                Headline4(
                                  title: TranslationData.map.tr,
                                  fontSize: Get.locale!.languageCode == 'ar'
                                      ? 22
                                      : 20,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Line(),
                                const SizedBox(
                                  height: 8,
                                ),
                                BodyText1(
                                  title: TranslationData.goToMapQuestion.tr,
                                  fontSize: Get.locale!.languageCode == 'ar'
                                      ? 16
                                      : 18,
                                  color: AppColors.lightGrey,
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                PrimaryButton(
                                  onTap: () {},
                                  title: TranslationData.goToMap.tr,
                                )
                              ],
                            ),
                          ),
                        ),
                        true,
                      );
                    },
                    imageUrl: craftsman.picture!,
                    name: craftsman.name,
                    city: craftsman.city!,
                    street: craftsman.street!,
                    occupation: craftsman.occupationType!,
                    rating: craftsman.rating!,
                    craftsman: craftsman);
              },
            ),
          );
        }),
      ),
    );
  }
}
