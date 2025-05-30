import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/data/model/auth/craftsman_model.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/app_icon.dart';
import 'package:hirfi_home/view/widget/text/body_text2.dart';

Widget chatCard({
  required VoidCallback onTap,
  required String? imageUrl,
  required String? name,
  required String? lastMessage,
  required String? time,
}) {
  final fallbackImage = 'assets/images/default_user.png';
  final displayImage =
      (imageUrl?.isNotEmpty ?? false) ? imageUrl! : fallbackImage;
  final isNetworkImage = imageUrl?.startsWith('http') ?? false;

  return Directionality(
    textDirection: Directionality.of(Get.context!),
    child: InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width,
        margin: const EdgeInsets.only(bottom: 26),
        padding: const EdgeInsets.all(12),
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
          children: [
            Container(
              width: Get.width * 0.20,
              height: Get.width * 0.20,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              clipBehavior: Clip.hardEdge,
              child: isNetworkImage
                  ? Image.network(
                      displayImage,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.person, size: 40),
                      ),
                    )
                  : Image.asset(
                      displayImage,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: BodyText2(
                          title: name?.trim().isEmpty ?? true
                              ? 'مستخدم جديد'
                              : name!,
                          fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                          color: AppColors.headLineText,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      BodyText2(
                        title: time ?? '',
                        fontSize: Get.locale!.languageCode == "ar" ? 14 : 12,
                        color: AppColors.headLineText,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  BodyText2(
                    title: lastMessage?.trim().isEmpty ?? true
                        ? 'لا توجد رسائل بعد'
                        : lastMessage!,
                    fontSize: 13,
                    color: Colors.grey,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
