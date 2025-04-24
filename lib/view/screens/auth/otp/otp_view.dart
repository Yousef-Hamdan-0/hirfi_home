import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/theme/text_themes.dart';
import 'package:hirfi_home/util/exptions.dart';
import 'package:hirfi_home/util/tools/tools.dart';
import 'package:hirfi_home/view/screens/auth/otp/otp_controller.dart';
import 'package:hirfi_home/view/widget/otp/pin_code_fields.dart';

import 'package:hirfi_home/view/widget/primary_appbar/primary_appbar.dart';
import 'package:hirfi_home/view/widget/progress_button/progress_button.dart';
import 'package:hirfi_home/view/widget/text/headline1.dart';
import 'package:hirfi_home/view/widget/text/headline5.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => appTools.unFocusKeyboard(context),
      child: Scaffold(
        appBar: PrimaryAppbar(
          onTap: (){},
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
                      height: 120,
                    ),
                    Center(
                      child: Headline1(
                        title: 'Helmet',
                        style: TextThemeStyle().headline1.copyWith(
                              color: AppColors.primary,
                              fontSize: 60,
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: Headline5(
                        title: 'Create your account',
                        style: TextThemeStyle().headline5.copyWith(
                              color: const Color.fromARGB(255, 118, 118, 120),
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    PinCodeTextField(
                      length: 6,
                      appContext: context,
                      controller: controller.otpController,
                      keyboardType: TextInputType.number,
                      animationType: AnimationType.scale,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        fieldHeight: 45,
                        fieldWidth: 45,
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
                      height: 40,
                    ),
                    ProgressButton(
                      borderRadius: BorderRadius.circular(16),
                      title: TranslationData.send.tr,
                      color: AppColors.primary,
                      onPressed:
                          (AnimationController animationController) async {
                        animationController.forward();
                        await Future.delayed(const Duration(seconds: 3));
                        animationController.reverse();
                      },
                    ),
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
