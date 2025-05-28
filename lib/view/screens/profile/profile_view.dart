import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/app_icon.dart';
import 'package:hirfi_home/util/routes/routes_string.dart';
import 'package:hirfi_home/view/screens/profile/profile_controller.dart';
import 'package:hirfi_home/view/widget/primary_appbar/primary_appbar.dart';
import 'package:hirfi_home/view/widget/text/body_text1.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: PrimaryAppbar(
          onTap: () {
            Get.toNamed(RoutesString.settings);
          },
          imageIcon: Image.asset(AppIcon.setting),
          title: TranslationData.profile.tr,
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
            child: Center(
                child: Column(children: [
              Obx(() {
                final imageUrl = controller.Photo.value;
                final isValidUrl =
                    Uri.tryParse(imageUrl)?.hasAbsolutePath == true;

                return Container(
                  width: MediaQuery.sizeOf(context).width * 0.45,
                  height: MediaQuery.sizeOf(context).width * 0.45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: isValidUrl
                          ? NetworkImage(imageUrl)
                          : AssetImage(AppIcon.profileCircle) as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
              Obx(() {
                final name = controller.name.value;
                return BodyText1(title: name);
              })
            ]))));
  }
}
