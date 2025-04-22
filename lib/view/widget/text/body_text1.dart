import 'package:flutter/material.dart';
import 'package:hirfi_home/theme/text_themes.dart';

class BodyText1 extends StatelessWidget {
  const BodyText1({
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
            TextThemeStyle().bodyText1.copyWith(
                  fontWeight: fontWeight ?? FontWeight.bold,
                  color: color ?? Colors.black,
                  fontSize: fontSize ?? 15,
                ),
        maxLines: maxLines ?? 1,
        overflow: overflow ?? TextOverflow.ellipsis,
        textAlign: textAlign ?? TextAlign.start,
      );
}
