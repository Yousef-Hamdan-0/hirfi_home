import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/exptions.dart';
import 'package:hirfi_home/util/images.dart';
import 'package:hirfi_home/util/tools/tools.dart';
import 'package:hirfi_home/view/screens/auth/otp/otp_controller.dart';
import 'package:hirfi_home/view/widget/otp/pin_code_fields.dart';
import 'package:hirfi_home/view/widget/primary_appbar/primary_appbar.dart';
import 'package:hirfi_home/view/widget/text/body_text2.dart';
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
          icon: Icons.arrow_back,
        ),
        backgroundColor: AppColors.white,
        body: Form(
          key: controller.otpForm,
          child: Padding(
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
                  ElevatedButton(
                    onPressed: () => controller.verifyAndContinue(),
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            AppColors.buttonsBackground)),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.buttonsBackground,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Headline5(
                          title: TranslationData.verify.tr,
                          fontSize: Get.locale!.languageCode == 'ar' ? 18 : 16,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Obx(() => TextButton(
                            onPressed: controller.start.value == 0
                                ? controller.resendOtp
                                : null,
                            child: Text(
                              controller.start.value == 0
                                  ? 'إعادة إرسال الرمز'
                                  : 'يمكنك الإرسال خلال ${controller.start.value} ثانية',
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
