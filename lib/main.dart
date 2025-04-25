<<<<<<< HEAD
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hirfi_home/firebase_options.dart';
=======
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
>>>>>>> f804626c1a0da5cfccb909dc35e6c76c18ebb8a1
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/helper/translation/app_translation.dart';
import 'package:hirfi_home/util/routes/get_page.dart';
import 'package:hirfi_home/util/routes/routes_string.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://liwguhcjusramuclyipr.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imxpd2d1aGNqdXNyYW11Y2x5aXByIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM1NzAxNzcsImV4cCI6MjA1OTE0NjE3N30.452407CvEDunvcTPDA2a_0_bqv6NzdGnh3pATfxA7iY",
  );
<<<<<<< HEAD
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
=======
>>>>>>> f804626c1a0da5cfccb909dc35e6c76c18ebb8a1
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
        ),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: const Locale('ar'),
      initialRoute: RoutesString.splash,
      getPages: getPage,
      translations: AppTranslation(),
    );
  }
}
