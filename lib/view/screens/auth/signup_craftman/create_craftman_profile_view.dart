import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/app_icon.dart';
import 'package:hirfi_home/util/routes/routes_string.dart';
import 'package:hirfi_home/view/screens/auth/signup_craftman/create_craftman_profile_controller.dart';
import 'package:hirfi_home/view/widget/main_select.dart';
import 'package:hirfi_home/view/widget/primary_appbar/primary_appbar.dart';
import 'package:hirfi_home/view/widget/primary_button/primary_button.dart';
import 'package:hirfi_home/view/widget/text/body_text1.dart';
import 'package:hirfi_home/view/widget/text/headline5.dart';
import 'package:hirfi_home/view/widget/text_field.dart';

class createCraftsmanProfileView
    extends GetView<createCraftsmanProfileController> {
  const createCraftsmanProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppbar(
        onTap: () {},
        centerTitle: false,
        title: TranslationData.fillYourProfile.tr,
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 24, right: 24),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 1,
          shrinkWrap: false,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      Obx(
                        () => Container(
                          width: MediaQuery.sizeOf(context).width * 0.45,
                          height: MediaQuery.sizeOf(context).width * 0.45,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: controller.selectedImage.value == null
                                ? DecorationImage(
                                    image: AssetImage(AppIcon.profileCircle),
                                    fit: BoxFit.fill,
                                  )
                                : DecorationImage(
                                    image: FileImage(
                                        controller.selectedImage.value!),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        right: 8,
                        child: InkWell(
                          onTap: () {
                            controller.pickImageFromGallery();
                          },
                          child: Image.asset(AppIcon.imageEdit),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        lable(text: TranslationData.yourName.tr),
                        MainTextField(
                            controller: controller.nameController,
                            hint: controller.name.value,
                            enabled: false,
                            textInputType: TextInputType.none),
                        SizedBox(
                          height: 20,
                        ),
                        lable(text: TranslationData.ocupationType.tr),
                        DropdownButtonFormField2(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(8),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Color(0xffD1D5DB)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          hint: const Text("اختر مهنتك"),
                          value:
                              controller.selectedOccupationKey.value.isNotEmpty
                                  ? controller.selectedOccupationKey.value
                                  : null,
                          items: controller.occupationOptions.map((entry) {
                            return DropdownMenuItem<String>(
                              value: entry
                                  .key, // المفتاح الإنجليزي الذي يُرسل لـ Supabase
                              child: Text(entry.value), // النص المترجم للمستخدم
                            );
                          }).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              controller.selectedOccupationKey.value = value;
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            lable(
                              text: TranslationData.workingTime.tr,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BodyText1(
                                    title: TranslationData.days.tr,
                                    fontSize: Get.locale!.languageCode == 'ar'
                                        ? 16
                                        : 14,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  MainSelect(
                                    items: controller.dayItems,
                                    initialValue: controller.selectedDays,
                                    onConfirm: (values) {
                                      controller.selectedDays.value =
                                          values.cast<String>();
                                    },
                                    title: TranslationData.selectDay.tr,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      BodyText1(
                                        title: TranslationData.hours.tr,
                                        fontSize:
                                            Get.locale!.languageCode == 'ar'
                                                ? 16
                                                : 14,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        width: 122,
                                        child: DropdownButtonFormField2(
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.all(8),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1,
                                                    color: Color(0xffD1D5DB)),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              )),
                                          hint: Text("00:00"),
                                          items: controller.hours
                                              .map((item) => DropdownMenuItem(
                                                    value: item,
                                                    child: Text(item),
                                                  ))
                                              .toList(),
                                          onChanged: (value) => controller
                                              .startTime
                                              .value = value as String,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      BodyText1(
                                        title: '',
                                        fontSize:
                                            Get.locale!.languageCode == 'ar'
                                                ? 16
                                                : 14,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        width: 122,
                                        child: DropdownButtonFormField2(
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.all(8),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              )),
                                          hint: Text("00:00"),
                                          items: controller.hours
                                              .map((item) => DropdownMenuItem(
                                                    value: item,
                                                    child: Text(item),
                                                  ))
                                              .toList(),
                                          onChanged: (value) => controller
                                              .endTime.value = value as String,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        BodyText1(
                          title: controller.getWorkingTimeText(
                              selectedDays: controller.selectedDays,
                              startTime: controller.startTime.value,
                              endTime: controller.endTime.value),
                          fontSize: Get.locale!.languageCode == 'ar' ? 16 : 14,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        lable(text: TranslationData.aboutMe.tr),
                        MainTextField(
                          controller: controller.aboutMe,
                          hint: TranslationData.exApoutMe.tr,
                          textInputType: TextInputType.text,
                          // expands: true,
                          maxLine: 3,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              final result =
                                  await Get.toNamed(RoutesString.mapView);
                              if (result != null) {
                                controller.selectedLocation.value = result;
                                print("abc $result");
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(AppIcon.mapsIconOn),
                                SizedBox(
                                  width: 6,
                                ),
                                Headline5(
                                  title: TranslationData.addLocation.tr,
                                  fontSize: Get.locale!.languageCode == 'ar'
                                      ? 18
                                      : 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.headLineText,
                                )
                              ],
                            )),
                        SizedBox(
                          height: 32,
                        ),
                        PrimaryButton(
                          onTap: () async {
                            try {
                              await controller
                                  .completeCraftsmanProfile(); // ← فقط نادِ الدالة
                            } catch (e) {
                              Get.snackbar(
                                  "خطأ", "حدث خطأ أثناء حفظ البيانات: $e");
                            }
                          },
                          title: TranslationData.createAccount.tr,
                        ),
                        SizedBox(
                          height: 32,
                        ),
                      ],
                    )),
              ],
            );
          },
        ),
      ),
    );
  }
}

class lable extends StatelessWidget {
  const lable({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BodyText1(
          title: text,
          fontSize: Get.locale!.languageCode == 'ar' ? 18 : 16,
        ),
        SizedBox(
          height: 8,
        )
      ],
    );
  }
}
