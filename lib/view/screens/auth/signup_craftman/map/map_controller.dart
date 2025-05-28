import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class MapController extends GetxController {
  RxSet<Marker> markers = <Marker>{}.obs;
  Rx<LatLng?> selectedLocation = Rx<LatLng?>(null);
  RxString city = ''.obs;
  RxString street = ''.obs;

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

      await _fetchAddressFromCoordinates(tappedPoint);
    } else {
      Get.snackbar("خطأ", "الرجاء تحديد موقع داخل الأردن فقط",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> _fetchAddressFromCoordinates(LatLng location) async {
    try {
      final placemarks =
          await placemarkFromCoordinates(location.latitude, location.longitude);

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;

        street.value = place.street ?? '';
        city.value = place.locality ??
            place.administrativeArea ??
            place.subAdministrativeArea ??
            '';
      }
    } catch (e) {
      street.value = '';
      city.value = '';
      print('❌ Failed to fetch address: $e');
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
