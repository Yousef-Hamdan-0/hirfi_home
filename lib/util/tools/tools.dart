import 'dart:io';
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/theme/text_themes.dart';
import 'package:hirfi_home/util/exptions.dart';
import 'package:hirfi_home/util/tools/android_loading.dart';
import 'package:hirfi_home/util/tools/ios_loading.dart';
import 'package:hirfi_home/view/widget/text/headline4.dart';
import 'package:hirfi_home/view/widget/text/headline5.dart';
import 'package:hirfi_home/view/widget/text/headline6.dart';
import 'package:toasty_box/toast_enums.dart';
import 'package:toasty_box/toasty_box.dart';

AppTools appTools = AppTools();

class AppTools {
  String? passwordValidate(TextEditingController controller) {
    // String pattern = RegExption.passwordPattern;
    // RegExp regExp = new RegExp(pattern);
    if (controller.text.isEmpty) {
      return TranslationData.passwordIsRequired.tr;
    } else if (controller.text.length < 8) {
      return 'passwordNumberMustatLeast'.tr;
    }
    // else if (regExp.hasMatch(controller.text) == false) {
    //   return 'passwordMustContainNumber'.tr;
    // }
    return null;
  }

  String? passwordSetValidate(TextEditingController controller) {
    String pattern = RegExption.passwordPattern;
    RegExp regExp = RegExp(pattern);
    if (controller.text.isEmpty) {
      return TranslationData.passwordIsRequired.tr;
    } else if (controller.text.length < 8) {
      return TranslationData.thePasswordMustNotBeLessThan8Characters.tr;
    } else if (regExp.hasMatch(controller.text) == false) {
      return TranslationData.passwordPattern.tr;
    }
    return null;
  }

  String? confirmPasswordValidate(
    TextEditingController password,
    TextEditingController confirmPass,
  ) {
    if (password.text.isNotEmpty) {
      if (!passwordChecker(
        password.text,
        password,
        confirmPass,
      )) {
        return 'passwordNotMatch';
      }
    }
    return null;
  }

  bool passwordChecker(
    String value,
    TextEditingController password,
    TextEditingController confirmPassword,
  ) {
    bool samePassword = false;
    bool passRole = passwordRole(password);
    samePassword = samePass(password, confirmPassword);
    if (passRole && samePassword) {
      return true;
    } else {
      return false;
    }
  }

  bool samePass(
    TextEditingController password,
    TextEditingController confirmPassword,
  ) {
    if ((password.text == confirmPassword.value.text) &&
        (password.text.isNotEmpty && confirmPassword.text.isNotEmpty)) {
      return true;
    } else {
      return false;
    }
  }

  bool passwordRole(TextEditingController password) {
    bool eightCharacter = false;
    bool characterCase = false;
    bool numberOfDigit = false;
    String number = r'^(?=.*?[0-9])';
    RegExp numberregExp = RegExp(number);
    String letter = r'^(?=.*?[A-Z])(?=.*?[a-z])';
    String sympol = r'(?=.*?[!@#\$&*~%])';
    RegExp regExp = RegExp(sympol);
    RegExp letterregExp = RegExp(letter);
    if (password.text.length >= 8) {
      eightCharacter = true;
    } else {
      eightCharacter = false;
    }
    if (letterregExp.hasMatch(password.text)) {
      characterCase = true;
    } else {
      characterCase = false;
    }

    if ((numberregExp.hasMatch(password.text) &&
        regExp.hasMatch(password.text))) {
      numberOfDigit = true;
    } else {
      numberOfDigit = false;
    }
    if (eightCharacter && characterCase && numberOfDigit) {
      return true;
    } else {
      return false;
    }
  }

  String? emailValidate(TextEditingController controller) {
    RegExp regExp = RegExp(RegExption.email);
    if (controller.text.isEmpty) {
      return TranslationData.pleaseEnterYourEmail.tr;
    } else if (!regExp.hasMatch(controller.text)) {
      return TranslationData.theEmailAddressYouEnteredIsInvalid.tr;
    }
    return null;
  }

  bool emailValidateHelp(String text) {
    RegExp regExp = RegExp(RegExption.emailVal);
    if (regExp.hasMatch(text)) {
      return true;
    }
    return false;
  }

  String? emailOrPhoneValidate(TextEditingController controller) {
    RegExp regExp = RegExp(RegExption.email);
    if (controller.text.isEmpty) {
      return 'this_field_is_required'.tr;
    } else if (!regExp.hasMatch(controller.text)) {
      return 'enter_a_valid_email_address'.tr;
    }
    return null;
  }

  String? nameValidate(TextEditingController controller) {
    if (controller.text.isEmpty) {
      return TranslationData.pleaseEnterYourName.tr;
    }
    return null;
  }

  String? phoneNumberValidate(TextEditingController controller) {
    if (controller.text.isEmpty) {
      return 'this_field_is_required'.tr;
    }
    if (controller.text.length < 7) {
      return 'phoneNumberMustatLeast'.tr;
    }

    return null;
  }

  String? phoneNumberValidate2(TextEditingController controller) {
    RegExp regExp = RegExp(RegExption.phoneVal);
    if (controller.text.isEmpty) {
      return TranslationData.phoneNumberCannotBeEmpty.tr;
    } else if (!regExp.hasMatch(controller.text)) {
      return TranslationData.phoneNumberPattern.tr;
    }
    if (controller.text.length < 9) {
      return TranslationData.phoneNumberLength.tr;
    }

    return null;
  }

  bool phoneNumberValidateHelp(String phone) {
    if (phone.contains(RegExp(RegExption.noNumber))) {
      return false;
    } else if (phone.length < 4) {
      return false;
    }

    return true;
  }

  String? expiryDateValidate(TextEditingController controller) {
    if (controller.text.isEmpty) {
      return 'this_field_is_required'.tr;
    } else if (controller.text.length < 3) {
      return 'pleaseEnterVaildName';
    } else if (controller.text
        .contains(RegExp('[a-zA-Zا-ي?=.*!@#\$%^&*(),.?:{}|<>]'))) {
      return 'shouldBeContainsNumbersOnly'.tr;
    } else {
      return null;
    }
  }

  String? requiredFieldValidate(TextEditingController controller) {
    if (controller.value.text.isEmpty || controller.value.text == '') {
      return 'this_field_is_required'.tr;
    }
    return null;
  }

  String? phoneOrEmailFieldValidate(TextEditingController controller) {
    if (controller.value.text.isEmpty || controller.value.text == '') {
      return 'this_field_is_required'.tr;
    }
    return null;
  }

  void unFocusKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  int createRandom() {
    int randomID;
    math.Random random = math.Random();
    int randomFirst = random.nextInt(1000000000) + 1000000;
    int randomSecond = random.nextInt(100000) + randomFirst;
    randomID = randomFirst + randomSecond;
    return randomID;
  }

  Future<void> showCustomBottomSheet(
    BuildContext context,
    Widget child,
    bool isDismissible,
  ) async {
    await showModalBottomSheet(
      enableDrag: false,
      elevation: 5,
      isScrollControlled: true,
      backgroundColor: AppColors.white.withOpacity(0),
      context: context,
      isDismissible: isDismissible,
      builder: (BuildContext newContext) => SingleChildScrollView(
        child: child,
      ),
    );
  }

  void showLoading() {
    if (Platform.isIOS) {
      showDialog(
        barrierDismissible: false,
        context: Get.context!,
        builder: (_) => const Center(
          child: IosLoading(),
        ),
        barrierColor: Colors.transparent,
        routeSettings: const RouteSettings(name: 'loading'),
      );
    }
    if (Platform.isAndroid) {
      showDialog(
        barrierDismissible: false,
        context: Get.context!,
        builder: (_) => const Dialog(
          backgroundColor: Colors.white,
          child: AndroidLoading(),
        ),
      );
    }
  }

  String timeFormatter(double time) {
    Duration duration = Duration(seconds: time.round());
    return <int>[duration.inMinutes, duration.inSeconds]
        .map((int seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }

  void showAlertDialogTwoFun(
    BuildContext context, {
    VoidCallback? yes,
    VoidCallback? no,
    String? title,
    String? content,
  }) {
    showCupertinoModalPopup<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Center(
          child: Headline5(
            title: title ?? 'alert'.tr,
          ),
        ),
        content: Headline6(
          title: content ?? 'Proceed with destructive action?',
          maxLines: 5,
          textAlign: TextAlign.center,
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: no ??
                () {
                  Get.back();
                },
            child: Text('cancel'.tr),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: yes ??
                () {
                  Get.back();
                },
            child: Text(
              'confirm'.tr,
              style: TextThemeStyle().headline5,
            ),
          ),
        ],
      ),
    );
  }

  void showAlertDialogOneFun(
    BuildContext context, {
    VoidCallback? onTap,
    String? title,
    String? content,
  }) {
    showCupertinoModalPopup<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Center(
            child: Headline4(
              title: title ?? 'alert'.tr,
              style: TextThemeStyle().headline4.copyWith(color: AppColors.red),
            ),
          ),
        ),
        content: Headline6(
          title: content ?? 'Proceed with destructive action?',
          maxLines: 4,
          textAlign: TextAlign.center,
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: onTap ?? () => Get.back(),
            child: Headline6(title: 'confirm'.tr),
          ),
        ],
      ),
    );
  }

  void showSuccessMessage(String message, BuildContext context) {
    ToastService.showSuccessToast(
      context,
      length: ToastLength.medium,
      expandedHeight: 100,
      message: "This is a warning toast!",
    );
  }

  void showWarningMessage(String message, BuildContext context) {
    ToastService.showWarningToast(
      context,
      length: ToastLength.medium,
      expandedHeight: 100,
      message: "This is a warning toast!",
    );
  }

  void showErrorMessage(String message, BuildContext context) {
    ToastService.showErrorToast(
      context,
      length: ToastLength.medium,
      expandedHeight: 100,
      message: "This is a warning toast!",
    );
  }
}
