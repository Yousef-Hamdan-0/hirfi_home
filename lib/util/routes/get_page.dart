import 'package:get/get.dart';
import 'package:hirfi_home/util/routes/routes_string.dart';
import 'package:hirfi_home/view/screens/auth/login/login_binding.dart';
import 'package:hirfi_home/view/screens/auth/login/login_viwe.dart';
import 'package:hirfi_home/view/screens/auth/otp/otp_binding.dart';
import 'package:hirfi_home/view/screens/auth/otp/otp_view.dart';
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
import 'package:hirfi_home/view/screens/staticPages/cookiesPolicy/cookies_policy_view.dart';
import 'package:hirfi_home/view/screens/staticPages/helpAndSupport/help_and_support_view.dart';
import 'package:hirfi_home/view/screens/staticPages/termsAndConditions/terms_and_conditions_view.dart';
import 'package:hirfi_home/view/screens/welcome/welcome_binding.dart';
import 'package:hirfi_home/view/screens/welcome/welcome_viwe.dart';

List<GetPage<dynamic>>? getPage = [
  GetPage(
      name: RoutesString.splash,
      page: () => const CookiesPolicyView(),
      //binding: SplashBinding()
      ),
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
  ),
  GetPage(
    name: RoutesString.otp,
    page: () => OtpView(),
    binding: OtpBinding(),
  )
];
