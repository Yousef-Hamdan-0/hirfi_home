import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/data/repositroy/user_auth_repo.dart';
import 'package:hirfi_home/util/routes/routes_string.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> signInForm = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool visibility = true.obs;
  RxBool isLoading = false.obs;

  final AuthUserRepository _authRepo;
  LoginController(this._authRepo);

  void onOffVisibility() {
    visibility.value = !visibility.value;
    update();
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('خطأ', 'يرجى إدخال البريد وكلمة المرور');
      return;
    }

    try {
      isLoading(true);

      final user = await _authRepo.signIn(email: email, password: password);

      // ✅ تم تسجيل الدخول، انتقل للصفحة الرئيسية
      Get.offAllNamed(RoutesString.mainShell);
    } catch (e) {
      Get.snackbar('فشل تسجيل الدخول', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
