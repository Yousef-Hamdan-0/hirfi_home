import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:hirfi_home/data/model/auth/craftsman_model.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/app_icon.dart';
import 'package:hirfi_home/view/screens/craftsman_detail/craftsman_detail_controller.dart';
import 'package:hirfi_home/view/screens/home/widget/craftsman_card.dart';
import 'package:hirfi_home/view/screens/home/widget/other_details.dart';
import 'package:hirfi_home/view/widget/expandable_text/expandable_text.dart';
import 'package:hirfi_home/view/widget/primary_button/primary_button.dart';
import 'package:hirfi_home/view/widget/text/body_text2.dart';
import 'package:hirfi_home/view/widget/text/headline5.dart';

class CraftsmanDetailView extends GetView<CraftsmanDetailController> {
  final Craftsman craftsman = Get.arguments as Craftsman;
  CraftsmanDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.appBarIcon,
            )),
        title: Headline5(
          title: TranslationData.craftsmenDetails.tr,
          fontSize: Get.locale!.languageCode == "ar" ? 22 : 20,
          color: AppColors.almostBlack,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_outline_rounded,
                color: AppColors.appBarIcon,
              ))
        ],
        backgroundColor: AppColors.white,
      ),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              craftsmanCard(
                onTap: () {},
                imageUrl: craftsman.picture!,
                name: craftsman.name,
                occupation: craftsman.occupationType!,
                city: craftsman.city!,
                street: craftsman.street!,
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  otherDetails(
                      icon: Image.asset(AppIcon.users),
                      data: craftsman.costumerCount!,
                      typeData: TranslationData.patients.tr),
                  otherDetails(
                      icon: Image.asset(AppIcon.medal),
                      data: craftsman.experienceYears!,
                      typeData: TranslationData.experience.tr),
                  otherDetails(
                      icon: Image.asset(AppIcon.star),
                      data: craftsman.rating!.toInt(),
                      typeData: TranslationData.rating.tr),
                  otherDetails(
                      icon: Image.asset(AppIcon.messages),
                      data: craftsman.reviewsCount!,
                      typeData: TranslationData.reviews.tr)
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Headline5(
                title: TranslationData.workingTime.tr,
                fontSize: Get.locale!.languageCode == 'ar' ? 22 : 20,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 8,
              ),
              BodyText2(
                title:
                    "${craftsman.dayOfWeek}, ${craftsman.startTime}-${craftsman.endTime}",
                fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                color: AppColors.lightGrey,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 16,
              ),
              Headline5(
                title: TranslationData.aboutMe.tr,
                fontSize: Get.locale!.languageCode == 'ar' ? 22 : 20,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 8,
              ),
              ExpandableText(
                text: "${craftsman.aboutMe}",
                trimLines: 2,
              ),
              SizedBox(
                height: 16,
              ),
              Headline5(
                title: TranslationData.phoneNumber.tr,
                fontSize: Get.locale!.languageCode == 'ar' ? 22 : 20,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 8,
              ),
              BodyText2(
                title: craftsman.phoneNumber,
                fontSize: Get.locale!.languageCode == "ar" ? 16 : 14,
                color: AppColors.lightGrey,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomeElevatedButton(
                    onPressed: () {},
                    image: Image.asset(AppIcon.mapsIconOn),
                    titel: TranslationData.location.tr,
                  ),
                  CustomeElevatedButton(
                    onPressed: () {},
                    image: Image.asset(AppIcon.chatIconOn),
                    titel: TranslationData.message.tr,
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Headline5(
                title: TranslationData.rateCraftsman.tr,
                fontSize: Get.locale!.languageCode == 'ar' ? 22 : 20,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBar.builder(
                    initialRating: controller.userRating.value.toDouble(),
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      controller.userRating(rating.toInt());
                      // يمكنك هنا إرسال التقييم إلى الخادم أو تخزينه حسب الحاجة
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              PrimaryButton(onTap: () {}, title: "قييم")
            ],
          ),
        ),
      ),
    );
  }
}

class CustomeElevatedButton extends StatelessWidget {
  const CustomeElevatedButton({
    super.key,
    required this.onPressed,
    required this.image,
    required this.titel,
  });
  final VoidCallback onPressed;
  final Image image;
  final String titel;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            fixedSize: Size(MediaQuery.sizeOf(context).width * 0.40, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image,
            SizedBox(
              width: 4,
            ),
            Headline5(
              title: titel,
              fontSize: Get.locale!.languageCode == 'ar' ? 18 : 16,
              fontWeight: FontWeight.bold,
              color: AppColors.darkBlue,
            )
          ],
        ));
  }
}
