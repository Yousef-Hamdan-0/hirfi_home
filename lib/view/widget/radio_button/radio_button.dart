import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/fonts.dart';
import 'package:hirfi_home/view/widget/text/body_text1.dart';
import 'package:flutter/material.dart';

class RadioButton extends StatelessWidget {
  const RadioButton({
    super.key,
    required this.title1,
    required this.option,
    required this.groupValue,
    required this.onChanged,
    this.title2,
  });
  final String title1;
  final String? title2;
  final String option;
  final dynamic groupValue;
  final ValueChanged onChanged;
  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: title2 == null
          ? BodyText1(
              title: title1,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.almostBlack,
            )
          : RichText(
              text: TextSpan(children: [
              TextSpan(
                  text: title1,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppFonts.interReg,
                      color: AppColors.almostBlack)),
              TextSpan(
                  text: title2,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: AppColors.almostBlack))
            ])),
      value: option,
      groupValue: groupValue,
      onChanged: onChanged,
      fillColor: WidgetStateProperty.all(AppColors.buttonsBackground),
    );
  }
}
