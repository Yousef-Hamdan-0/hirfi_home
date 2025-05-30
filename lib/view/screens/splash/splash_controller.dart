import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/util/routes/routes_string.dart';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashController extends GetxController {
  RxBool moveH = false.obs;
  RxBool showIrfi = false.obs;
  RxBool showHome = false.obs;
  RxBool moveHomeDown = false.obs;
  final RxBool hasInternet = true.obs;

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
    final hasConnection = await hasInternetConnection();
    if (!hasConnection) {
      print('📡 No Internet connection');
      return;
    }

    final isLoggedIn = await checkSupabaseSession();

    if (isLoggedIn) {
      print('✅ Logged in session found');

      final userId = Supabase.instance.client.auth.currentUser?.id;

      if (userId != null) {
        try {
          // جلب الدور من جدول المستخدمين
          final userInfo = await Supabase.instance.client
              .from('app_users')
              .select('role')
              .eq('id', userId)
              .single();

          final role = userInfo['role'];

          if (role == 'craftsman') {
            // تحقق من is_approved
            final response = await Supabase.instance.client
                .from('craftsman')
                .select('is_approved')
                .eq('craftman_id', userId)
                .maybeSingle();

            final isApproved = response?['is_approved'] == true;

            if (isApproved) {
              Get.offAllNamed(RoutesString.mainShell);
            } else {
              Get.offAllNamed(RoutesString.waitView);
            }
          } else {
            // مستخدم عادي يدخل مباشرة
            Get.offAllNamed(RoutesString.mainShell);
          }
        } catch (e) {
          print('❌ Error during role check: $e');
          Get.offAllNamed(RoutesString.mainShell); // افتراضيًا يدخل
        }
      } else {
        Get.offAllNamed(RoutesString.mainShell);
      }
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

  Future<bool> hasInternetConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      print('📴 لا يوجد اتصال بالشبكة');
      return false;
    }

    try {
      final result = await http
          .get(Uri.parse('https://clients3.google.com/generate_204'))
          .timeout(Duration(seconds: 5));

      final online = result.statusCode == 204;
      print(online ? '✅ الاتصال فعّال' : '🌐 الشبكة بدون إنترنت');
      return online;
    } catch (e) {
      print('❌ فشل اختبار الإنترنت: $e');
      return false;
    }
  }
}
