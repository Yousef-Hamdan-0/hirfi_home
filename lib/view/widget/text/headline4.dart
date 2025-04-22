import 'package:hirfi_home/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:hirfi_home/theme/text_themes.dart';

class Headline4 extends StatelessWidget {
  const Headline4({
    super.key,
    required this.title,
    this.style,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.textDecoration,
    this.color,
    this.fontSize,
    this.fontWeight,
  });
  final String title;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) => Text(
        title,
        style: style ??
            TextThemeStyle().headline4.copyWith(
                  fontWeight: fontWeight ?? FontWeight.bold,
                  color: color ?? AppColors.almostBlack,
                  fontSize: fontSize ?? 20,
                ),
        maxLines: maxLines ?? 1,
        overflow: overflow ?? TextOverflow.ellipsis,
        textAlign: textAlign ?? TextAlign.start,
      );
}
