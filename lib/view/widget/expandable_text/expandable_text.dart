import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/util/fonts.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int trimLines;

  const ExpandableText({
    super.key,
    required this.text,
    this.trimLines = 3,
  });

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _readMore = false;

  @override
  Widget build(BuildContext context) {
    final textSpan = TextSpan(
      text: widget.text,
      style: TextStyle(
          color: AppColors.darkGrey,
          fontFamily: Get.locale!.languageCode == 'ar'
              ? AppFonts.tajawalReg
              : AppFonts.interReg,
          fontSize: Get.locale!.languageCode == 'ar' ? 16 : 14),
    );

    final textPainter = TextPainter(
      text: textSpan,
      maxLines: widget.trimLines,
      textDirection: TextDirection.ltr,
    )..layout(
        maxWidth: MediaQuery.of(context).size.width - 32,
      );

    final isOverflowing = textPainter.didExceedMaxLines;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: _readMore ? null : widget.trimLines,
          overflow: _readMore ? TextOverflow.visible : TextOverflow.ellipsis,
        ),
        if (isOverflowing)
          GestureDetector(
            onTap: () => setState(() => _readMore = !_readMore),
            child: Text(
              _readMore ? 'View Less' : 'View More',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
