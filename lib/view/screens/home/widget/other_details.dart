import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/view/widget/text/body_text2.dart';

Widget otherDetails(
    {required Image icon, required int data, required String typeData}) {
  return Directionality(
      textDirection: Directionality.of(Get.context!),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: Get.width * 0.15,
            width: Get.width * 0.15,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xffF3F4F6)),
            child: Center(
              child: icon,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          BodyText2(
            title: "$data",
            fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
            color: AppColors.darkGrey,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 2,
          ),
          BodyText2(
            title: typeData,
            fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
            color: AppColors.lightGrey,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ));
}
