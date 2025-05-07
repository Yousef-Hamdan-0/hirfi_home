import 'package:get/get.dart';
import 'package:hirfi_home/controller/navigation_controller/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(() => NavigationController());
  }
}
