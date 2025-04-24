import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/helper/src/supabase.dart';
import 'package:hirfi_home/util/routes/routes_string.dart';
import 'package:hirfi_home/util/tools/tools.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hirfi_home/view/widget/my_country_code/country_code_method.dart';

class SignupUserController extends GetxController {
  final GlobalKey<FormState> signUpForm = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isChecked = false.obs;

  void onChecked() {
    isChecked.value = !isChecked.value;
    // update();
  }

  Future<void> signUpWithProfile({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
  }) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    try {
      // 1. إنشاء حساب جديد في auth
      final authResponse = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
      );

      final user = authResponse.user;
      if (user == null) {
        scaffoldMessenger.showSnackBar(const SnackBar(
          content: Text("Sign up failed: user is null"),
          backgroundColor: Colors.red,
        ));
        return;
      }

      final userId = user.id;

      // 2. إنشاء سجل في user_profiles
      await Supabase.instance.client.from('user_profiles').insert({
        'id': userId,
        'email': email,
        'name': name,
        'phone_number': phoneNumber,
      });

      scaffoldMessenger.showSnackBar(const SnackBar(
        content: Text("Account created successfully!"),
        backgroundColor: Colors.green,
      ));
    } catch (e) {
      scaffoldMessenger.showSnackBar(SnackBar(
        content: Text("Sign up error: $e"),
        backgroundColor: Colors.red,
      ));
    }
  }

  void sendOtp() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    appTools.showLoading();
    await auth.verifyPhoneNumber(
      phoneNumber: '+962${phoneNumberController.text}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.log(e.message!);
      },
      codeSent: (String verificationId, int? resendToken) {
        Get.log(verificationId);
        String phone =
            mainCountryCode.value.dialCode + phoneNumberController.text;
        Get.log(phone);

        Get.toNamed(
          RoutesString.otp,
          arguments: [
            verificationId,
            phone,
            emailController.text,
            nameController.text,
          ],
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
    Get.back();
  }
}
