import 'package:get/get.dart';
import 'package:hirfi_home/view/screens/create_profile/create_profile_controller.dart';

class CreateProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CreateProfileController>(() => CreateProfileController());
  }
}