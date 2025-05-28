import 'package:get/get.dart';
import 'package:hirfi_home/controller/navigation_controller/navigation_controller.dart';
import 'package:hirfi_home/data/repositroy/user_auth_repo.dart';
import 'package:hirfi_home/data/repositroy/user_profile_repo.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_fetch_service.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_send_service.dart';
import 'package:hirfi_home/view/screens/home/controller/home_controller.dart';
import 'package:hirfi_home/view/screens/map/maps_controller.dart';
import 'package:hirfi_home/view/screens/profile/profile_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<MapsController>(() => MapsController(SupabaseFetchService()));
    Get.lazyPut(() => SupabaseFetchService());
    Get.lazyPut(() => SupabaseSendService());
    Get.lazyPut(() => AuthUserRepository());
    Get.lazyPut(() => UserProfileRepository(
          Get.find<SupabaseFetchService>(),
          Get.find<SupabaseSendService>(),
        ));
    Get.lazyPut<ProfileController>(
        () => ProfileController(Get.find<UserProfileRepository>()));
    Get.lazyPut<NavigationController>(() => NavigationController());
  }
}
