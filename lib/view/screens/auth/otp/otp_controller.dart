import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/data/model/auth/user_profile.dart';
import 'package:hirfi_home/data/repositroy/user_auth_repo.dart';
import 'package:hirfi_home/data/repositroy/user_profile_repo.dart';
import 'package:hirfi_home/util/routes/routes_string.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OtpController extends GetxController {
  final GlobalKey<FormState> otpForm = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();

  final AuthUserRepository _authRepo;
  final UserProfileRepository _profileRepo;
  RxInt counter = 0.obs;
  RxInt oldStart = 30.obs;
  RxString verificationId = ''.obs;
  RxString saveName = ''.obs;
  RxString saveEmail = ''.obs;
  RxString savePhonenumber = ''.obs;
  RxString savePassword = ''.obs;
  RxString selectedRole = 'user'.obs;

  RxInt start = 30.obs;
  Rx<Timer> timer = Timer(const Duration(seconds: 30), () {}).obs;

  RxBool isLoading = false.obs;

  OtpController(this._authRepo, this._profileRepo);

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer.value = Timer.periodic(oneSec, (Timer timer) {
      if (start.value == 0) {
        timer.cancel();
      } else {
        start.value--;
      }
    });
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
    final client = Supabase.instance.client;
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
      await client.from('craftsman').insert({
        'craftman_id': userId,
        'name': name,
        'email': email,
        'phone_number': phone,
        'is_approved': false,
      });
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

    await client.from('app_users').insert({
      'id': userId,
      'name': name,
      'email': email,
      'phone_number': phone,
      'picture': null,
      'role': role,
    });
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
}
