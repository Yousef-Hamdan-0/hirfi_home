import 'package:get/get.dart';
import 'package:hirfi_home/controller/navigation_controller/navigation_binding.dart';
import 'package:hirfi_home/util/routes/routes_string.dart';
import 'package:hirfi_home/view/screens/auth/signup_craftman/map/map_binding.dart';
import 'package:hirfi_home/view/screens/auth/signup_craftman/map/map_view.dart';
import 'package:hirfi_home/view/screens/change_password/phone_number_for_otp/enter_phone_number_binding.dart';
import 'package:hirfi_home/view/screens/change_password/phone_number_for_otp/enter_phone_number_controller.dart';
import 'package:hirfi_home/view/screens/change_password/phone_number_for_otp/enter_phone_number_view.dart';
import 'package:hirfi_home/view/screens/chat/chat_binding.dart';
import 'package:hirfi_home/view/screens/chat/chat_view.dart';
import 'package:hirfi_home/main_shell_view.dart';
import 'package:hirfi_home/view/screens/home/page/home_view.dart';
import 'package:hirfi_home/view/screens/profile/profile_binding.dart';
import 'package:hirfi_home/view/screens/profile/profile_view.dart';
import 'package:hirfi_home/view/screens/auth/login/login_binding.dart';
import 'package:hirfi_home/view/screens/auth/login/login_view.dart';
import 'package:hirfi_home/view/screens/auth/otp/otp_binding.dart';
import 'package:hirfi_home/view/screens/auth/otp/otp_view.dart';
import 'package:hirfi_home/view/screens/auth/signup_craftman/create_craftman_profile_binding.dart';
import 'package:hirfi_home/view/screens/auth/signup_craftman/create_craftman_profile_view.dart';
import 'package:hirfi_home/view/screens/auth/signup_user/signup_user_binding.dart';
import 'package:hirfi_home/view/screens/auth/signup_user/signup_user_view.dart';
import 'package:hirfi_home/view/screens/create_profile/create_user_profile_binding.dart';
import 'package:hirfi_home/view/screens/create_profile/create_user_profile_view.dart';
import 'package:hirfi_home/view/screens/home/home_binding.dart';
import 'package:hirfi_home/view/screens/home/home_view.dart';
import 'package:hirfi_home/view/screens/create_profile/create_profile_binding.dart';
import 'package:hirfi_home/view/screens/create_profile/create_profile_view.dart';
import 'package:hirfi_home/view/screens/home/controller/home_binding.dart';
import 'package:hirfi_home/view/screens/map/maps_binding.dart';
import 'package:hirfi_home/view/screens/map/maps_view.dart';
import 'package:hirfi_home/view/screens/onbording/onbording_binding.dart';
import 'package:hirfi_home/view/screens/onbording/onbording_view.dart';
import 'package:hirfi_home/view/screens/settings/setting_binfing.dart';
import 'package:hirfi_home/view/screens/settings/settings_view.dart';
import 'package:hirfi_home/view/screens/splash/splash_binding.dart';
import 'package:hirfi_home/view/screens/splash/splash_view.dart';
import 'package:hirfi_home/view/screens/settings/change_password/change_password_bindings.dart';
import 'package:hirfi_home/view/screens/settings/change_password/change_password_view.dart';
import 'package:hirfi_home/view/screens/welcome/welcome_binding.dart';
import 'package:hirfi_home/view/screens/welcome/welcome_view.dart';

List<GetPage<dynamic>>? getPage = [
  GetPage(
      name: RoutesString.splash,
      page: () => const SplashView(),
      binding: SplashBinding()),
  GetPage(
      name: RoutesString.onbording,
      page: () => OnbordingView(),
      binding: OnbordingBinding()),
  GetPage(
      name: RoutesString.welcomeScreen,
      page: () => WelcomeView(),
      binding: WelcomeBinding()),
  GetPage(
    name: RoutesString.login,
    page: () => LoginView(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: RoutesString.changePassword,
    page: () => ChangePasswordView(),
    binding: ChangePasswordBindings(),
  ),
  GetPage(
    name: RoutesString.createCraftsmanProfileView,
    page: () => createCraftsmanProfileView(),
    binding: createCraftsmanProfileBinding(),
  ),
  GetPage(
    name: RoutesString.signUpUser,
    page: () => SignupUserView(),
    binding: SignupUserBinding(),
  ),
  GetPage(
    name: RoutesString.otp,
    page: () => OtpView(),
    binding: OtpBinding(),
  ),
  GetPage(
      name: RoutesString.createProfile,
      page: () => CreateUserProfileView(),
      binding: CreateUserProfileBinding()),
  GetPage(
    name: RoutesString.homeScreen,
    page: () => HomeView(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: RoutesString.mapScreen,
    page: () => MapsView(),
    binding: MapsBinding(),
  ),
  GetPage(
    name: RoutesString.chatScreen,
    page: () => ChatView(),
    binding: ChatBinding(),
  ),
  GetPage(
    name: RoutesString.profileScreen,
    page: () => ProfileView(),
    binding: ProfileBinding(),
  ),
  GetPage(
      name: RoutesString.settings,
      page: () => const SettingsView(),
      binding: SettingBinding()),
  GetPage(
    name: RoutesString.mainShell,
    page: () => MainShellView(),
    binding: NavigationBinding(),
  ),
  GetPage(
    name: RoutesString.mapView,
    page: () => GoogleMapScreen(),
    binding: MapBinding(),
  )
];
