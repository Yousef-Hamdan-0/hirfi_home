import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/data/model/auth/user_profile.dart';
import 'package:hirfi_home/data/repositroy/user_auth_repo.dart';
import 'package:hirfi_home/data/repositroy/user_profile_repo.dart';
import 'package:hirfi_home/util/routes/routes_string.dart';

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

  RxBool isLoading = false.obs;
  RxString saveName = ''.obs;
  RxString saveEmail = ''.obs;
  RxString savePhonenumber = ''.obs;
  RxString savePassword = ''.obs;
  final AuthUserRepository _authRepo;
  final UserProfileRepository _profileRepo;

  OtpController(this._authRepo, this._profileRepo);
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

  void saveData(String newName, String newEmail, String newPhone,
      String newPassword, String newVerificationId) {
    saveName.value = newName;
    saveEmail.value = newEmail;
    savePhonenumber.value = newPhone;
    savePassword.value = newPassword;
    verificationId.value = newVerificationId;
  }

  bool _validateFields(
      String name, String email, String phone, String password) {
    if (name.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty) {
      Get.snackbar('بيانات ناقصة', 'جميع الحقول مطلوبة');
      return false;
    }
    return true;
  }

  Future<void> _createAccountAndProfile({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    final authUser = await _authRepo.signUp(
      email: email,
      password: password,
      userMetadata: {
        'name': name,
        'phone': phone,
      },
    );

    final profile = UserProfile(
      id: authUser.id,
      name: name,
      email: email,
      phoneNumber: phone,
      profilePicture: null,
      dateOfBirth: null,
      gender: null,
    );

    await _profileRepo.insertProfile(profile);
  }

  Future<void> signUp() async {
    final name = saveName.value.trim();
    final email = saveEmail.value.trim();
    final phone = savePhonenumber.value.trim();
    final password = savePassword.value;

    if (!_validateFields(name, email, phone, password)) return;

    try {
      isLoading(true);
      await _createAccountAndProfile(
        name: name,
        email: email,
        phone: phone,
        password: password,
      );
      Get.offAllNamed(RoutesString.createProfile);
    } catch (e) {
      Get.snackbar('فشل التسجيل', e.toString());
    } finally {
      isLoading(false);
    }
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
