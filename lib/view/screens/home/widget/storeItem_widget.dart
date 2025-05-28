import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/data/model/auth/craftsman_model.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/app_icon.dart';
import 'package:hirfi_home/util/routes/routes_string.dart';
import 'package:hirfi_home/view/widget/read_only_rating/read_only_rating.dart';
import 'package:hirfi_home/view/widget/text/body_text2.dart';

Widget buildStoreItem({
  required String imageUrl,
  required String name,
  required String city,
  required String street,
  required double rating,
  required int reviews,
  required Craftsman craftsman,
}) {
  final isNetworkImage = imageUrl.startsWith('http');

  return Directionality(
    textDirection: Directionality.of(Get.context!),
    child: InkWell(
      onTap: () {
        Get.toNamed(RoutesString.craftsmanDetail, arguments: craftsman);
      },
      child: Container(
        width: Get.width * 0.6,
        margin: const EdgeInsetsGeometry.fromSTEB(0, 0, 16, 0),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              child: Column(
                children: [
                  isNetworkImage
                      ? Image.network(
                          imageUrl,
                          width: double.infinity,
                          height: Get.height * 0.19,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            width: double.infinity,
                            height: Get.height * 0.19,
                            color: Colors.grey.shade300,
                            child: const Icon(Icons.broken_image),
                          ),
                        )
                      : Image.asset(
                          imageUrl,
                          width: double.infinity,
                          height: Get.height * 0.19,
                          fit: BoxFit.cover,
                        ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BodyText2(
                              title: name,
                              fontSize:
                                  Get.locale!.languageCode == "ar" ? 16 : 14,
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
                                  fontSize: Get.locale!.languageCode == 'ar'
                                      ? 14
                                      : 12,
                                  color: AppColors.lightGrey,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                BodyText2(
                                  title: "$rating",
                                  fontSize: 12,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                ReadOnlyRating(
                                  rating: rating,
                                  starSize: 16,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                BodyText2(
                                  title:
                                      "($reviews ${TranslationData.reviews.tr})",
                                  fontSize: Get.locale!.languageCode == 'ar'
                                      ? 14
                                      : 12,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
