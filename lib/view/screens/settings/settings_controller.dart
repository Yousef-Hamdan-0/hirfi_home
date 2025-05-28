import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hirfi_home/util/routes/routes_string.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SettingsController extends GetxController {
  Future<void> signOutUser() async {
    try {
      await Supabase.instance.client.auth.signOut();

      final box = GetStorage();
      await Future.delayed(const Duration(milliseconds: 300));
      await box.erase();
      
      Get.offAllNamed(RoutesString.welcomeScreen);
      print('✅ تم تسجيل الخروج بنجاح');
    } catch (e) {
      print('❌ فشل تسجيل الخروج: $e');
      Get.snackbar('خطأ', 'حدث خطأ أثناء تسجيل الخروج');
    }
  }
}
