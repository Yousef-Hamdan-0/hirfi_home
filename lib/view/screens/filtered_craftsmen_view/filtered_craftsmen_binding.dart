import 'package:get/get.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_fetch_service.dart';

import 'package:hirfi_home/view/screens/filtered_craftsmen_view/filtered_craftsmen_controller.dart';

class FilteredCraftsmenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FilteredCraftsmenController>(
        () => FilteredCraftsmenController(SupabaseFetchService()));
  }
}
