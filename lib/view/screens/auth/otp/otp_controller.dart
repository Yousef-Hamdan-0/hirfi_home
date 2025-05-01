import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/util/routes/routes_string.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class OtpController extends GetxController {
  var data = Get.arguments;
  final GlobalKey<FormState> otpForm = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  String phone = '';
  RxString verificationId = ''.obs;
  RxInt start = 30.obs;
  RxInt oldStart = 30.obs;
  RxInt counter = 4.obs;
  RxInt otpCounter = 0.obs;
  Rx<Timer> timer = Timer(const Duration(seconds: 30), () {}).obs;
  final SupabaseClient _supabase = Supabase.instance.client;
  RxBool isLoading = false.obs;
  RxString saveName = ''.obs;
  RxString saveEmail = ''.obs;
  RxString savePhonenumber = ''.obs;
  RxString savePassword = ''.obs;

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

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      isLoading(true);

      // 1. إنشاء المستخدم في Supabase Auth
      final authResponse = await _supabase.auth.signUp(
        email: email.trim(),
        password: password.trim(),
      );

      if (authResponse.user?.id != null) {
        // 2. حفظ البيانات الإضافية في جدول profiles
        await _supabase.from('user_profile').insert({
          'id': authResponse.user!.id,
          'email': email.trim(), // نفس ID المستخدم في auth.users
          'name': name.trim(),
          'phone_number': phone.trim(),
        });

        Get.offAllNamed(RoutesString.homeScreen); // الانتقال للصفحة الرئيسية
      }
    } on AuthException catch (e) {
      Get.snackbar('خطأ', e.message);
    } catch (e) {
      Get.snackbar('خطأ', 'حدث خطأ غير متوقع: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }

  void saveData(String newName, String newEmail, String newPhone,
      String newPassword, String newVerificationId) {
    saveName.value = newName;
    saveEmail.value = newEmail;
    savePhonenumber.value = newPhone;
    savePassword.value = newPassword;
    verificationId.value = newVerificationId;
  }

  Future<bool> verifyOtpCode({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      return true; // تحقق ناجح
    } on FirebaseAuthException catch (_) {
      return false; // تحقق فاشل
    }
  }
}
