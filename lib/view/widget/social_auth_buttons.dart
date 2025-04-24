import 'package:flutter/material.dart';

class SocialAuthButtons extends StatelessWidget {
  const SocialAuthButtons({
    super.key,
    required this.onTab,
    required this.image,
  });
  final Image image;
  final VoidCallback onTab;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        height: MediaQuery.sizeOf(context).width * 0.15,
        width: MediaQuery.sizeOf(context).width * 0.15,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Color(0xff000000).withOpacity(0.1)),
        child: Center(
          child: image,
        ),
      ),
    );
  }
}
