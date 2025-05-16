import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/fonts.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class MainSelect extends StatelessWidget {
  const MainSelect({
    super.key,
    required this.items,
    required this.initialValue,
    required this.onConfirm,
    required this.title,
    this.searchable,
  });
  final List<MultiSelectItem<String>> items;
  final List<String> initialValue;
  final Function(List<String>) onConfirm;
  final String title;
  final bool? searchable;
  @override
  Widget build(BuildContext context) {
    return MultiSelectDialogField<String>(
      items: items,
      initialValue: initialValue,
      onConfirm: onConfirm,
      buttonIcon: Icon(Icons.keyboard_arrow_down),
      chipDisplay: MultiSelectChipDisplay.none(),
      cancelText: Text(
        TranslationData.cansel.tr,
        style: TextStyle(
            fontSize: Get.locale!.languageCode == 'ar' ? 18 : 16,
            fontFamily: Get.locale!.languageCode == 'ar'
                ? AppFonts.tajawalReg
                : AppFonts.interReg,
            color: AppColors.textButton),
      ),
      searchable: searchable ?? true,
      confirmText: Text(
        TranslationData.ok.tr,
        style: TextStyle(
          fontSize: Get.locale!.languageCode == 'ar' ? 18 : 16,
          fontFamily: Get.locale!.languageCode == 'ar'
              ? AppFonts.tajawalReg
              : AppFonts.interReg,
          color: AppColors.textButton,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: Get.locale!.languageCode == 'ar' ? 20 : 18,
          fontFamily: Get.locale!.languageCode == 'ar'
              ? AppFonts.tajawalBold
              : AppFonts.interBold,
        ),
      ),
      validator: (values) {
        if (values == null || values.isEmpty) {
          return TranslationData.pleaseSelectAtLeastOneDay.tr;
        }
        return null;
      },
      dialogHeight: 300,
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Color(0xffD1D5DB),
          ),
          borderRadius: BorderRadius.circular(8)),
    );
  }
}
