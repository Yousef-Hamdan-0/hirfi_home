import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gif_view/gif_view.dart';

import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/images.dart';
import 'package:hirfi_home/util/routes/routes_string.dart';
import 'package:hirfi_home/view/widget/primary_button/primary_button.dart';
import 'package:hirfi_home/view/widget/text/headline4.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WaitView extends StatelessWidget {
  const WaitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 32,
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GifView.asset(
                      ImagesAssets.sandClock,
                      height: MediaQuery.sizeOf(context).width * 0.3,
                      width: MediaQuery.sizeOf(context).width * 0.3,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Headline4(
                      title: TranslationData.pleaseWait.tr,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: PrimaryButton(
                onTap: () async {
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
                },
                title: TranslationData.logOut.tr,
                backgroundColor: AppColors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
