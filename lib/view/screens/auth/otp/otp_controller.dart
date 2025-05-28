import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/data/model/auth/craftsman_model.dart';
import 'package:hirfi_home/data/model/auth/user_profile.dart';
import 'package:hirfi_home/data/repositroy/craftsman_repo.dart';
import 'package:hirfi_home/data/repositroy/user_auth_repo.dart';
import 'package:hirfi_home/data/repositroy/user_profile_repo.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_fetch_service.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_send_service.dart';
import 'package:hirfi_home/util/routes/routes_string.dart';
import 'package:hirfi_home/view/screens/auth/signup_user/signup_user_controller.dart';

class OtpController extends GetxController {
  final GlobalKey<FormState> otpForm = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();

  final AuthUserRepository _authRepo;
  final UserProfileRepository _profileRepo;
  //Timer
  RxInt start = 30.obs;
  Rx<Timer?> timer = Rx<Timer?>(null);
  RxInt resendAttempts = 3.obs;
  RxInt baseDuration = 30.obs;
  //End Timer
  RxString verificationId = ''.obs;
  RxString saveName = ''.obs;
  RxString saveEmail = ''.obs;
  RxString savePhonenumber = ''.obs;
  RxString savePassword = ''.obs;
  RxString selectedRole = 'user'.obs;

  RxBool isLoading = false.obs;

  OtpController(this._authRepo, this._profileRepo);

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() {
    timer.value?.cancel(); 
    start.value = baseDuration.value;

    timer.value = Timer.periodic(
      Duration(seconds: 1),
      (t) {
        if (start.value == 0) {
          t.cancel();
        } else {
          start.value--;
        }
      },
    );
  }

  void resendOtp() {
    if (start.value > 0) return; 

    if (resendAttempts.value <= 0) {
      Get.snackbar('انتهت المحاولات', 'لا يمكنك إعادة إرسال الرمز أكثر من مرة');
      return;
    }

    resendAttempts.value -= 1;

    baseDuration.value *= 2;
    startTimer();

    Get.find<SignupUserController>().sendOtp();
  }

  void sendOtpAgain() {
    startTimer(); 
    Get.find<SignupUserController>().sendOtp();
  }

  void saveData(
    String newName,
    String newEmail,
    String newPhone,
    String newPassword,
    String newVerificationId,
    String newRole,
  ) {
    saveName.value = newName;
    saveEmail.value = newEmail;
    savePhonenumber.value = newPhone;
    savePassword.value = newPassword;
    verificationId.value = newVerificationId;
    selectedRole.value = newRole;
  }

  bool _validateFields(
    String name,
    String email,
    String phone,
    String password,
  ) {
    if (name.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty) {
      Get.snackbar('بيانات ناقصة', 'جميع الحقول مطلوبة');
      return false;
    }
    return true;
  }

  Future<void> _createAccount({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String role,
  }) async {
    final authUser = await _authRepo.signUp(
      email: email,
      password: password,
      userMetadata: {
        'name': name,
        'phone': phone,
      },
    );

    final userId = authUser.id;

    if (role == 'craftsman') {
      final craftsmanRepo = CraftsmanRepository(
        SupabaseFetchService(),
        SupabaseSendService(),
      );

      final craftsman = Craftsman(
        id: userId,
        name: name,
        email: email,
        phoneNumber: phone,
        picture: null,
        occupationType: null,
        aboutMe: null,
        costumerCount: 0,
        experienceYears: 0,
        rating: 0.0,
        reviewsCount: 0,
        address: null,
        createdAt: DateTime.now().toIso8601String(),
        isApproved: false,
      );

      await craftsmanRepo.insertCraftsman(craftsman);
    } else {
      final profile = UserProfile(
        id: userId,
        name: name,
        email: email,
        phoneNumber: phone,
        profilePicture: null,
        dateOfBirth: null,
        gender: null,
      );
      await _profileRepo.insertProfile(profile);
    }
  }

  Future<void> signUp() async {
    final name = saveName.value.trim();
    final email = saveEmail.value.trim();
    final phone = savePhonenumber.value.trim();
    final password = savePassword.value;
    final role = selectedRole.value;

    if (!_validateFields(name, email, phone, password)) return;

    try {
      isLoading(true);
      await _createAccount(
        name: name,
        email: email,
        phone: phone,
        password: password,
        role: role,
      );
      if (selectedRole.value == 'craftsman') {
        Get.offAllNamed(RoutesString.createCraftsmanProfileView);
      } else {
        Get.offAllNamed(RoutesString.createProfile);
      }
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
      return true;
    } on FirebaseAuthException catch (_) {
      return false;
    }
  }

  Future<void> verifyAndContinue() async {
    if (!otpForm.currentState!.validate()) return;

    final code = otpController.text.trim();
    final id = verificationId.value;

    isLoading(true);
    final isVerified = await verifyOtpCode(
      verificationId: id,
      smsCode: code,
    );

    if (isVerified) {
      await signUp();
    } else {
      Get.snackbar('فشل التحقق', 'رمز OTP غير صحيح');
    }
    isLoading(false);
  }
}
