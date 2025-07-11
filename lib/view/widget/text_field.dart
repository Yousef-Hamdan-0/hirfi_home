import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/fonts.dart';

class MainTextField extends StatelessWidget {
  const MainTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.textInputType,
    this.hintColor,
    this.title,
    this.focusNode,
    this.validator,
    this.maxLength,
    this.enabled,
    this.obscureText,
    this.onChanged,
    this.prefixIcon,
    this.formatter,
    this.typeInput,
    this.suffix,
    this.suffixIcon,
    this.color,
    this.backgrgroundColor,
    this.withWhiteBorder,
    this.maxLine,
    this.focus,
    this.textAlign,
    this.textInputAction,
    this.iconSize,
    this.isDense,
    this.onFieldSubmitted,
    this.expands,
  });
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final String hint;
  final Color? hintColor;
  final TextInputType textInputType;
  final Widget? prefixIcon, suffix, suffixIcon;
  final int? maxLength;
  final bool? enabled;
  final bool? obscureText;
  final bool? iconSize;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? formatter;
  final String? typeInput;
  final bool? withWhiteBorder;
  final Color? color;
  final Color? backgrgroundColor;
  final int? maxLine;
  final bool? focus;
  final TextAlign? textAlign;
  final TextInputAction? textInputAction;
  final bool? isDense;
  final Function(String)? onFieldSubmitted;
  final String? title;
  final bool? expands;
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Subtitle1(
          //   title: title ?? "",
          //   color: AppColors.almostBlack,
          // ),
          // SizedBox(
          //   height: 12,
          // ),
          TextFormField(
            minLines: 1,
            expands: enabled ?? false,
            enabled: enabled,
            scrollPadding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 300,
            ),
            autocorrect: true,
            showCursor: true,
            cursorColor: Colors.black,
            focusNode: focusNode,
            inputFormatters: formatter,
            onChanged: onChanged,
            controller: controller,
            validator: validator,
            keyboardType: textInputType,
            textInputAction: textInputAction,
            onFieldSubmitted: (_) {
              if ((textInputAction == TextInputAction.done) &&
                  textInputAction != TextInputAction.next) {
                FocusScope.of(context).unfocus();
              }
              if (onFieldSubmitted != null) {
                onFieldSubmitted!(_); // ✅
              }
            },
            maxLines: maxLine ?? 1,
            textAlign: textAlign ?? TextAlign.start,
            style: TextStyle(
              fontSize: 16,
              fontFamily: Get.locale!.languageCode == 'ar'
                  ? AppFonts.tajawalReg
                  : AppFonts.interReg,
            ),
            obscureText: obscureText ?? false,
            mouseCursor: MouseCursor.defer,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                left: 18,
                right: 12,
                top: 16,
                bottom: 16,
              ),
              isDense: isDense ?? false,
              errorMaxLines: 4,
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: Color(0xffD1D5DB),
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: const Color(0xffF5F5F5),
                  width: 0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.buttonsBackground,
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1.6),
                borderRadius: BorderRadius.circular(12.0),
              ),
              filled: true,
              prefixIcon: Padding(
                padding: Get.locale!.languageCode == "ar"
                    ? const EdgeInsets.only(left: 8, right: 16)
                    : const EdgeInsets.only(left: 16, right: 8),
                child: prefixIcon,
              ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 10,
              ),
              fillColor: backgrgroundColor ?? Color(0xffF5F5F5),
              hintText: hint,
              hintStyle: TextStyle(
                color: hintColor ?? AppColors.hintText,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                fontFamily: AppFonts.interReg,
              ),
            ),
          ),
        ],
      );
}
