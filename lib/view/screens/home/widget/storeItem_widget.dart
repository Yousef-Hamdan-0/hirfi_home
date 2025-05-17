// ignore_for_file: file_names

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/view/widget/text/body_text1.dart';

Widget buildStoreItem({required String imageUrl, required String name}) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imageUrl,
            width: Get.width*0.6,
            height: Get.height*0.19,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        BodyText1(title: name),

        
      ],
    );
  }
