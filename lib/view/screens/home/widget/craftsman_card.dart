import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/app_icon.dart';
import 'package:hirfi_home/view/widget/text/body_text2.dart';

Widget craftsmanCard({
  required VoidCallback onTap,
  required String imageUrl,
  required String name,
  required String city,
  required String street,
  required String occupation,
}) {
  final isNetworkImage = imageUrl.startsWith('http');

  return Directionality(
    textDirection: Directionality.of(Get.context!),
    child: InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width,
        margin: const EdgeInsetsGeometry.fromSTEB(0, 0, 0, 26),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: Get.width * 0.25,
              height: Get.width * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: isNetworkImage
                  ? Image.network(
                      imageUrl,
                      width: double.infinity,
                      height: Get.height * 0.19,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width: double.infinity,
                        height: Get.height * 0.19,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(12)),
                        child: const Icon(Icons.broken_image),
                      ),
                    )
                  : Image.asset(
                      imageUrl,
                      width: double.infinity,
                      height: Get.height * 0.19,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BodyText2(
                  title: name,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  color: AppColors.headLineText,
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: AppColors.line,
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                BodyText2(
                  title: occupation,
                  fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                  color: AppColors.darkGrey,
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Image.asset(AppIcon.location),
                    SizedBox(
                      width: 4,
                    ),
                    BodyText2(
                      title: "$city,\n $street",
                      maxLines: 2,
                      fontSize: Get.locale!.languageCode == 'ar' ? 14 : 12,
                      color: AppColors.lightGrey,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
