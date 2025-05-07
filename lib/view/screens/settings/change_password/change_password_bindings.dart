import 'package:get/get.dart';
import 'package:hirfi_home/view/screens/settings/change_password/change_password_controller.dart';

class ChangePasswordBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordController>(() => ChangePasswordController());
  }
}
