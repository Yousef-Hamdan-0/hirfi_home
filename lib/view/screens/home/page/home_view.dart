import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/images.dart';
import 'package:hirfi_home/view/screens/home/controller/home_controller.dart';
import 'package:hirfi_home/view/screens/home/widget/categoryitem_widget.dart';
import 'package:hirfi_home/view/screens/home/widget/locationDropDown_widget.dart';
import 'package:hirfi_home/view/screens/home/widget/storeItem_widget.dart';

import 'package:hirfi_home/view/widget/text/body_text1.dart';

class HomeView extends  StatefulWidget {

   const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller=Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                // Location Bar
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:5 ),
                          child: BodyText1(title: "Location",fontWeight: FontWeight.w500,color: AppColors.lightGrey,),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: AppColors.buttonsBackground, size: 27),
                          const SizedBox(width: 5),
                        Obx(() =>    LocationDropdown(
                        selectedGovernorate: controller.selectedGovernorate.value.isNotEmpty
                            ? controller.selectedGovernorate.value
                            : null,
                        governorates: controller.governorates,
                        onChanged: (value) {
                          if (value != null) {
                            controller.selectedGovernorate.value = value;
                            controller.saveGovernorate(value);
                          }
                        },
                      ),),

                         Spacer(),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Stack(
                            children: [
                              const Icon(Icons.notifications_outlined,color: AppColors.buttonsBackground,size: 25,),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Search Bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey.shade600),
                      const SizedBox(width: 12),
                      Text(
                        'Search Craftsman...',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              

Column(
  children: [
    SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: PageView.builder(
        controller: controller.pageController,
        onPageChanged: (index) {
          controller.currentBannerIndex.value = index;
        },
        itemCount: controller.bannerItems.length,
        itemBuilder: (context, index) {
          final item = controller.bannerItems[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(item['image']),
                  fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withValues(alpha:  0.6),
                    Colors.black.withValues(alpha:  0.2),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item['titleLine1'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    item['titleLine2'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    item['description'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
                          ],
                        ),
                                          
                  
              
                const SizedBox(height: 16),
                // Dots Indicator
                Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < controller.bannerItems.length; i++)
                      GestureDetector(
                        onTap: () => controller.changeBannerIndex(i),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: controller.currentBannerIndex.value == i ? 35 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: controller.currentBannerIndex.value == i 
                                ? AppColors.buttonsBackground 
                                : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                  ],
                )),
                
                
                const SizedBox(height: 20),
                // Categories Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: BodyText1(title: "See All",color: AppColors.lightGrey,)
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Categories Grid
            Column(
            children: [
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 0.1,
                children: [
                  buildCategoryItem(
                    image: ImagesAssets.mechanic,
                    label: 'Mechanic',
                    color: Colors.grey.shade400,
                  ),
                  buildCategoryItem(
                    image: ImagesAssets.plumber,
                    label: 'Plumber',
                    color: Colors.teal,
                  ),
                  buildCategoryItem(
                    image: ImagesAssets.electrician,
                    label: 'Electrician',
                    color: Colors.purple.shade200,
                  ),

                ],
              ),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 0.1,
              children:  [
                  buildCategoryItem(
                  image: ImagesAssets.blacksmith,
                  label: 'Blacksmith',
                  color: Colors.grey.shade300,
                ),
                  buildCategoryItem(
                  image: ImagesAssets.carpenter,
                  label: 'Carpenter',
                  color: Colors.brown.shade300,
                  ),
                  buildCategoryItem(
                  image: ImagesAssets.builder,
                  label: 'Builder',
                  color: Colors.red.shade400,
                  ),
                            

                          ],
                        ),
                      ],
                    ),

                // Centers and Stores Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Centers and Stores',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('See All'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                  SizedBox(
                    height: Get.height*0.25 ,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.stores.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 12.0,bottom: 10),
                          child: buildStoreItem(
                            imageUrl: controller.stores[index]['imageUrl']!,
                            name: controller.stores[index]['name']!,
                          ),
                        );
                      },
                    ),
                  ),
                   SizedBox(height:  Get.height*0.01,),
                ],
              ),
            ),
          ),
        ),

    );
  }

 
}
 