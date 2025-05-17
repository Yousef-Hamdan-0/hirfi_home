import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class MapController extends GetxController {
  RxSet<Marker> markers = <Marker>{}.obs;
  Rx<LatLng?> selectedLocation = Rx<LatLng?>(null);

  late GoogleMapController mapController; 

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController.setMapStyle(null); 
  }

  Future<void> onTapMap(LatLng tappedPoint) async {
    if (await _isInJordan(tappedPoint)) {
      markers.value = {
        Marker(
          markerId: MarkerId('selected'),
          position: tappedPoint,
        ),
      };
      selectedLocation.value = tappedPoint;
    } else {
      Get.snackbar("خطأ", "الرجاء تحديد موقع داخل الأردن فقط",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<bool> _isInJordan(LatLng location) async {
    try {
      final placemarks = await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );
      return placemarks.any(
          (p) => p.country != null && p.country!.toLowerCase() == "jordan");
    } catch (e) {
      return false;
    }
  }
}
