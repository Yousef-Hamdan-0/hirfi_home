import 'package:get/get.dart';
import 'package:hirfi_home/view/screens/auth/signup_craftman/signup_craftman_controller.dart';

class createCraftsmanProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<createCraftsmanProfileController>(() => createCraftsmanProfileController());
  }
}
