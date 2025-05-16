// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hirfi_home/helper/translation/translation_data.dart';
// import 'package:hirfi_home/theme/app_colors.dart';
// import 'package:hirfi_home/util/fonts.dart';

// class MainSingleSelect extends StatelessWidget {
//   const MainSingleSelect({
//     super.key,
//     required this.items,
//     required this.selectedItem,
//     required this.onChanged,
//     required this.title,
//     this.searchable = true,
//   });

//   final List<DropdownSearchOnFind<String>> items;
//   final String? selectedItem;
//   final void Function(String?) onChanged;
//   final String title;
//   final bool searchable;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownSearch<String>(
//       items: items,
//       selectedItem: selectedItem,
//       onChanged: onChanged,
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return TranslationData.pleaseSelectAtLeastOneDay.tr;
//         }
//         return null;
//       },
//       decoratorProps: DropDownDecoratorProps(
//         decoration: InputDecoration(
//           contentPadding:
//               const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: const BorderSide(color: Color(0xffD1D5DB), width: 1),
//           ),
//           hintText: title,
//           hintStyle: TextStyle(
//             fontSize: Get.locale!.languageCode == 'ar' ? 16 : 14,
//             fontFamily: Get.locale!.languageCode == 'ar'
//                 ? AppFonts.tajawalReg
//                 : AppFonts.interReg,
//             color: AppColors.hintText,
//           ),
//         ),
//       ),
//       popupProps: PopupProps.dialog(
//         showSearchBox: searchable,
//         searchFieldProps: TextFieldProps(
//           decoration: InputDecoration(
//             hintText: 'بحث...',
//             contentPadding: const EdgeInsets.symmetric(horizontal: 12),
//           ),
//         ),
//         itemBuilder: (context, item, isDisabled, isSelected) =>
//             _customPopupItem(context, item, isSelected),
//       ),
//       dropdownBuilder: _customSelectedItem,
//     );
//   }

//   /// تصميم العنصر المختار
//   Widget _customSelectedItem(BuildContext context, String? item) {
//     return Text(
//       item ?? title,
//       style: TextStyle(
//         fontSize: 16,
//         fontFamily: Get.locale!.languageCode == 'ar'
//             ? AppFonts.tajawalReg
//             : AppFonts.interReg,
//       ),
//     );
//   }

//   /// تصميم العناصر داخل القائمة
//   Widget _customPopupItem(BuildContext context, String? item, bool isSelected) {
//     return ListTile(
//       title: Text(
//         item ?? '',
//         style: TextStyle(
//           fontFamily: Get.locale!.languageCode == 'ar'
//               ? AppFonts.tajawalReg
//               : AppFonts.interReg,
//         ),
//       ),
//       selected: isSelected,
//     );
//   }
// }
