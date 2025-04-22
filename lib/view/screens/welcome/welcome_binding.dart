import 'package:get/get.dart';
import 'package:hirfi_home/view/screens/welcome/welcome_controller.dart';

class WelcomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(() => WelcomeController());
  }
}
