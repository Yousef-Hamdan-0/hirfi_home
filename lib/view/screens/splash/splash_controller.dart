import 'package:get/get.dart';
import 'package:hirfi_home/util/routes/routes_string.dart';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashController extends GetxController {
  RxBool moveH = false.obs;
  RxBool showIrfi = false.obs;
  RxBool showHome = false.obs;
  RxBool moveHomeDown = false.obs;

  @override
  void onInit() async {
    super.onInit();
    _startAnimation();
  }

  void _startAnimation() async {
    await Future.delayed(Duration(milliseconds: 800));
    moveH.value = true;
    await Future.delayed(Duration(milliseconds: 800));
    showIrfi.value = true;

    await Future.delayed(Duration(milliseconds: 800));
    showHome.value = true;

    await Future.delayed(Duration(milliseconds: 400));
    moveHomeDown.value = true;
    await Future.delayed(Duration(milliseconds: 1200));
    startAppFlow();
  }

  void startAppFlow() async {
    final hasConnection = await checkConnection();
    if (!hasConnection) {
      print('📡 No Internet connection');
      return;
    }

    final isLoggedIn = await checkSupabaseSession();

    if (isLoggedIn) {
      print('✅ Logged in session found');
      Get.offAllNamed(RoutesString.homeScreen);
    } else {
      print('👤 No valid session, go to onboarding/login');
      Get.offAllNamed(RoutesString.onbording);
    }
  }

  Future<bool> checkSupabaseSession() async {
    final auth = Supabase.instance.client.auth;
    final session = auth.currentSession;

    if (session == null) return false;

    final expiry = session.expiresAt;
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    // ✅ إذا الجلسة منتهية، جرب التجديد
    if (expiry != null && expiry <= now) {
      try {
        final refreshed = await auth.refreshSession();
        return refreshed.session != null;
      } catch (e) {
        print('❌ Failed to refresh session: $e');
        return false;
      }
    }

    return true;
  }

  Future<bool> checkConnection() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'))
          .timeout(Duration(seconds: 5));

      if (response.statusCode == 200) {
        print('Internet is available');
        return true;
      } else {
        print('No real internet (non-200 response)');
        return false;
      }
    } catch (e) {
      print('No real internet (exception): $e');
      return false;
    }
  }
}
