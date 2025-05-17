import 'package:get/get.dart';
import 'package:hirfi_home/view/screens/auth/signup_craftman/map/map_controller.dart';

class MapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapController>(() => MapController());
  }
}
