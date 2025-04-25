<<<<<<< HEAD
import 'package:get/get.dart';
import 'package:hirfi_home/util/routes/routes_string.dart';
import 'package:http/http.dart' as http;
=======
import 'dart:io';
import 'package:get/get.dart';
import 'package:hirfi_home/util/routes/routes_string.dart';
>>>>>>> f804626c1a0da5cfccb909dc35e6c76c18ebb8a1
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
      print('No Internet connection');
      return;
    }

    final isLoggedIn = await checkSupabaseSession();

    if (isLoggedIn) {
      print('nar');
      Get.offAllNamed(RoutesString.homeScreen);
    } else {
      Get.offAllNamed(RoutesString.onbording);
    }
  }

  Future<bool> checkConnection() async {
    try {
<<<<<<< HEAD
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
=======
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('Real internet available');
        return true;
      } else {
        print('No real internet (empty result)');
        return false;
      }
    } on SocketException catch (_) {
      print('No real internet (socket exception)');
>>>>>>> f804626c1a0da5cfccb909dc35e6c76c18ebb8a1
      return false;
    }
  }

  Future<bool> checkSupabaseSession() async {
    final session = Supabase.instance.client.auth.currentSession;
    return session != null;
  }
}
