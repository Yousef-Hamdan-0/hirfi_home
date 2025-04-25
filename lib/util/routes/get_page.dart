import 'package:get/get.dart';
import 'package:hirfi_home/util/routes/routes_string.dart';
import 'package:hirfi_home/view/screens/auth/login/login_binding.dart';
import 'package:hirfi_home/view/screens/auth/login/login_viwe.dart';
<<<<<<< HEAD
import 'package:hirfi_home/view/screens/auth/otp/otp_binding.dart';
import 'package:hirfi_home/view/screens/auth/otp/otp_view.dart';
=======
>>>>>>> f804626c1a0da5cfccb909dc35e6c76c18ebb8a1
import 'package:hirfi_home/view/screens/auth/signup_craftman/signup_craftman_Binding.dart';
import 'package:hirfi_home/view/screens/auth/signup_craftman/signup_craftman_viwe.dart';
import 'package:hirfi_home/view/screens/auth/signup_user/signup_user_binding.dart';
import 'package:hirfi_home/view/screens/auth/signup_user/signup_user_viwe.dart';
import 'package:hirfi_home/view/screens/home/home_binding.dart';
import 'package:hirfi_home/view/screens/home/home_viwe.dart';
import 'package:hirfi_home/view/screens/onbording/onbording_binding.dart';
import 'package:hirfi_home/view/screens/onbording/onbording_viwe.dart';
import 'package:hirfi_home/view/screens/splash/splash_binding.dart';
import 'package:hirfi_home/view/screens/splash/splash_viwe.dart';
import 'package:hirfi_home/view/screens/welcome/welcome_binding.dart';
import 'package:hirfi_home/view/screens/welcome/welcome_viwe.dart';

List<GetPage<dynamic>>? getPage = [
  GetPage(
      name: RoutesString.splash,
      page: () => const SplashViwe(),
      binding: SplashBinding()),
  GetPage(
      name: RoutesString.onbording,
      page: () => OnbordingViwe(),
      binding: OnbordingBinding()),
  GetPage(
      name: RoutesString.welcomeScreen,
      page: () => WelcomeViwe(),
      binding: WelcomeBinding()),
  GetPage(
    name: RoutesString.homeScreen,
    page: () => HomeViwe(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: RoutesString.login,
    page: () => LoginViwe(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: RoutesString.signUpCraftman,
    page: () => SignupCraftmanViwe(),
    binding: SignupCraftmanBinding(),
  ),
  GetPage(
    name: RoutesString.signUpUser,
    page: () => SignupUserViwe(),
    binding: SignupUserBinding(),
<<<<<<< HEAD
  ),
  GetPage(
    name: RoutesString.otp,
    page: () => OtpView(),
    binding: OtpBinding(),
=======
>>>>>>> f804626c1a0da5cfccb909dc35e6c76c18ebb8a1
  )
];
