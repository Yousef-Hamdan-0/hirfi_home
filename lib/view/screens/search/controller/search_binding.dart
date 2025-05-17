import 'package:get/get.dart';
import 'package:hirfi_home/view/screens/search/controller/search_contoller.dart';



class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(() => SearchController());
  }
}
