import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hirfi_home/firebase_options.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/helper/translation/app_translation.dart';
import 'package:hirfi_home/util/routes/get_page.dart';
import 'package:hirfi_home/util/routes/routes_string.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

late GetStorage box;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://uacgfcwkaeomzwllqyin.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVhY2dmY3drYWVvbXp3bGxxeWluIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDYyMDExMTAsImV4cCI6MjA2MTc3NzExMH0.jAO1S4OSUzgY_2m94OF_Lo_lYgMjmMDsgBgFLlFaKPA",
    debug: true,
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  box = GetStorage();
  
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
