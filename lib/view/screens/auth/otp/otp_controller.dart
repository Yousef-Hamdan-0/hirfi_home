import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  var data = Get.arguments;
  final GlobalKey<FormState> otpForm = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  String phone = '';
  String verificationId = '';
  RxInt start = 30.obs;
  RxInt oldStart = 30.obs;
  RxInt counter = 4.obs;
  RxInt otpCounter = 0.obs;
  Rx<Timer> timer = Timer(const Duration(seconds: 30), () {}).obs;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }



  void startTimer() {
    const Duration oneSec = Duration(seconds: 1);
    timer.value = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
        } else {
          start.value--;
        }
      },
    );
  }
}
