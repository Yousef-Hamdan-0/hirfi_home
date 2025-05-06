import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/fonts.dart';

class MainDropdownField<T> extends StatelessWidget {
  const MainDropdownField({
    super.key,
    required this.items,
    required this.hint,
    required this.onChanged,
    required this.selectedItem,
    this.validator,
    this.prefixIcon,
    this.enabled,
    this.backgrgroundColor,
  });

  final List<T> items;
  final T? selectedItem;
  final String hint;
  final Widget? prefixIcon;
  final bool? enabled;
  final Color? backgrgroundColor;
  final String? Function(T?)? validator;
  final void Function(T?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: items.contains(selectedItem) ? selectedItem : null,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: backgrgroundColor ?? const Color(0xffF5F5F5),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        prefixIcon: Padding(
          padding: Get.locale!.languageCode == "ar"
              ? const EdgeInsets.only(left: 8, right: 16)
              : const EdgeInsets.only(left: 16, right: 8),
          child: prefixIcon,
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 10),
        hintText: hint,
        hintStyle: TextStyle(
          color: AppColors.hintText,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          fontFamily: AppFonts.interReg,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Color(0xffD1D5DB), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Color(0xffF5F5F5), width: 0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide:
              const BorderSide(color: AppColors.buttonsBackground, width: 1.2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.red, width: 1.6),
        ),
      ),
      icon: const Icon(Icons.arrow_drop_down),
      isExpanded: true,
      items: items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(item.toString(), style: const TextStyle(fontSize: 14)),
        );
      }).toList(),
      onChanged: enabled == false ? null : onChanged,
    );
  }
}
