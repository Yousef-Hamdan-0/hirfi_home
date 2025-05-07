import 'package:get/get.dart';
import 'package:hirfi_home/view/screens/map/maps_controller.dart';

class MapsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapsController>(() => MapsController());
  }
}
