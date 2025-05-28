import 'package:get/get.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_fetch_service.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_send_service.dart';
import 'package:hirfi_home/view/screens/map/maps_controller.dart';

class MapsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SupabaseSendService());
    Get.lazyPut(() => SupabaseFetchService());
    Get.lazyPut<MapsController>(() => MapsController(SupabaseFetchService()));
  }
}
