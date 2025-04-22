import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/view/widget/text/headline3.dart';
import 'package:flutter/material.dart';

class PrimaryCheckBox extends StatelessWidget {
  const PrimaryCheckBox(
      {super.key,
      this.value,
      required this.onChanged,
      this.onTap,
      this.activeColor,
      required this.label_1,
      this.label_2,
      this.borderRadius});
  final bool? value;
  final VoidCallback? onTap;
  final ValueChanged<bool?> onChanged;
  final String label_1;
  final String? label_2;
  final Color? activeColor;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value ?? false,
          fillColor:
              WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return Colors.grey;
            }
            return AppColors.buttonsBackground;
          }),
          onChanged: onChanged,
          activeColor: activeColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        label_2 == null
            ? Headline3(
                title: label_1,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: AppColors.almostBlack,
                ),
              )
            : Row(
                children: [
                  Headline3(
                    title: label_1,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  InkWell(
                    onTap: onTap,
                    child: Headline3(
                      title: label_2!,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.buttonsBackground,
                      ),
                    ),
                  )
                ],
              )
      ],
    );
  }
}
