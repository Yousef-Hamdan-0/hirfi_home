// lib/screens/google_map_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hirfi_home/view/screens/auth/signup_craftman/map/map_controller.dart';

class GoogleMapScreen extends GetView<MapController> {
  final CameraPosition initialPosition = CameraPosition(
    target: LatLng(31.963158, 35.930359), // عمان - الأردن
    zoom: 8.0,
  );

  GoogleMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('حدد موقع محلك'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              if (controller.selectedLocation.value != null) {
                Get.back(result: controller.selectedLocation.value);
              } else {
                Get.snackbar("تنبيه", "الرجاء تحديد موقع أولاً",
                    snackPosition: SnackPosition.BOTTOM);
              }
            },
          ),
        ],
      ),
      body: Obx(() => GoogleMap(
            onMapCreated: controller.onMapCreated,
            initialCameraPosition: initialPosition,
            markers: controller.markers.value,
            mapType: MapType.normal,
            myLocationEnabled: true,
            zoomControlsEnabled: true,
            onTap: controller.onTapMap,
          )),
    );
  }
}
