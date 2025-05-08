import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hirfi_home/util/routes/routes_string.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SettingsController extends GetxController {
  Future<void> signOutUser() async {
    try {
      // 1. تسجيل خروج من Supabase
      await Supabase.instance.client.auth.signOut();

      // 2. حذف أي بيانات مخزنة محليًا (مثل access_token)
      await GetStorage().erase();
      // 3. الانتقال إلى صفحة تسجيل الدخول أو البداية
      Get.offAllNamed(RoutesString
          .welcomeScreen); // أو RoutesString.login إذا كنت تستخدم Route Manager

      print('✅ تم تسجيل الخروج بنجاح');
    } catch (e) {
      print('❌ فشل تسجيل الخروج: $e');
      Get.snackbar('خطأ', 'حدث خطأ أثناء تسجيل الخروج');
    }
  }
}
