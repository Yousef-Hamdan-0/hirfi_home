import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'package:hirfi_home/view/screens/filtered_craftsmen_view/filtered_craftsmen_controller.dart';
import 'package:hirfi_home/view/screens/home/widget/craftsman_card2.dart';

class FilteredCraftsmenView extends GetView<FilteredCraftsmenController> {
  const FilteredCraftsmenView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await controller.fetchCraftsmenByOccupation(controller
            .currentOccupationKey.value); // أو أي دالة تجلب البيانات مجددًا
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("الفئة المختارة"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.filteredCraftsmen.isEmpty) {
              return const Center(child: Text("لا يوجد حرفيون مطابقون"));
            }

            return ListView.builder(
              itemCount: controller.filteredCraftsmen.length,
              itemBuilder: (context, index) {
                final craftsman = controller.filteredCraftsmen[index];
                return craftsmanCard2(
                  imageUrl: craftsman.picture!,
                  name: craftsman.name,
                  city: craftsman.city!,
                  street: craftsman.street!,
                  occupation: craftsman.occupationType!,
                  rating: craftsman.rating!,
                  craftsman: craftsman,
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
