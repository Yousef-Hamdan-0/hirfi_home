import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/theme/text_themes.dart';
import 'package:hirfi_home/util/exptions.dart';
import 'package:hirfi_home/util/images.dart';
import 'package:hirfi_home/util/tools/tools.dart';
import 'package:hirfi_home/view/screens/auth/otp/otp_controller.dart';
import 'package:hirfi_home/view/widget/otp/pin_code_fields.dart';

import 'package:hirfi_home/view/widget/primary_appbar/primary_appbar.dart';
import 'package:hirfi_home/view/widget/primary_button/primary_button.dart';
import 'package:hirfi_home/view/widget/progress_button/progress_button.dart';
import 'package:hirfi_home/view/widget/text/body_text2.dart';
import 'package:hirfi_home/view/widget/text/headline1.dart';
import 'package:hirfi_home/view/widget/text/headline4.dart';
import 'package:hirfi_home/view/widget/text/headline5.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => appTools.unFocusKeyboard(context),
      child: Scaffold(
        appBar: PrimaryAppbar(
          onTap: () {
            Get.back();
          },
        ),
        body: Form(
          key: controller.otpForm,
          child: Obx(
            () => Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Center(
                      child: Image.asset(ImagesAssets.lightModeLogo),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Center(
                        child: Column(
                      children: [
                        Headline4(
                          title: TranslationData.verifyCode.tr,
                          fontSize: Get.locale!.countryCode == "ar" ? 22 : 20,
                          color: AppColors.almostBlack,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        BodyText2(
                          title: TranslationData.enterTheCode.tr,
                          fontSize: Get.locale!.countryCode == "ar" ? 16 : 14,
                          maxLines: 2,
                          color: AppColors.lightGrey,
                        )
                      ],
                    )),
                    const SizedBox(
                      height: 32,
                    ),
                    PinCodeTextField(
                      length: 6,
                      appContext: context,
                      controller: controller.otpController,
                      keyboardType: TextInputType.number,
                      animationType: AnimationType.scale,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        fieldHeight: 50,
                        fieldWidth: 50,
                        borderWidth: 1.5,
                        borderRadius: BorderRadius.circular(16),
                        selectedColor: Colors.red.withOpacity(0),
                        selectedFillColor: Colors.white,
                        inactiveFillColor: Colors.white,
                        inactiveColor: Colors.grey.withOpacity(0),
                        activeColor: Colors.grey.withOpacity(0),
                        activeFillColor: Colors.grey.withOpacity(0.1),
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      onChanged: (String value) {},
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                          RegExp(RegExption.onlyNumber),
                        ),
                      ],
                      beforeTextPaste: (String? text) => true,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    PrimaryButton(
                        onTap: () {
                          
                          
                        },
                        title: TranslationData.verify.tr),
                    const SizedBox(
                      height: 26,
                    ),
                    InkWell(
                      onTap: () async {
                        if (controller.counter.value == 0 &&
                            controller.start.value == 0) {
                          // appTools.warningUser(
                          //   'otpError',
                          // );
                        }
                        if (controller.start.value == 0 &&
                            controller.counter.value > 0) {
                          controller.counter.value -= 1;
                          controller.start.value =
                              controller.oldStart.value * 2;
                          controller.oldStart.value = controller.start.value;
                          controller.timer.value.cancel();
                          controller.startTimer();
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Headline5(
                            title: 'resendCodeAfter' ' ',
                            style: TextThemeStyle().headline5.copyWith(
                                  color: AppColors.black.withOpacity(0.6),
                                ),
                          ),
                          Headline5(
                            title: appTools.timeFormatter(
                                controller.start.value.toDouble()),
                            style: TextThemeStyle().headline5.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
