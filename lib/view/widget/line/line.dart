import 'package:flutter/material.dart';
import 'package:hirfi_home/theme/app_colors.dart';

class Line extends StatelessWidget {
  const Line({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: color ?? AppColors.line,
            ),
          ),
        ),
      ],
    );
  }
}
