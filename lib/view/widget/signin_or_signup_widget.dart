// import 'package:hirfi_home/theme/app_colors.dart';
// import 'package:hirfi_home/view/screen/welcome/welcome_s_m_c.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SigninOrSignupWidget extends StatelessWidget {
//   const SigninOrSignupWidget({super.key,required this.child});
//   final Widget child;
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<WelcomeSMC>(builder: (Go) {
//       return AnimatedPositioned(
//         duration: Duration(milliseconds: 500),
//         curve: Curves.easeOut,
//         left: 0,
//         right: 0,
//         bottom: Go.isVisible ? 0 : -550,
//         child: Container(
//           height: MediaQuery.sizeOf(context).width,
//           width: MediaQuery.sizeOf(context).width,
//           decoration: const BoxDecoration(
//             color: AppColors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(30),
//               topRight: Radius.circular(30),
//             ),
//           ),
//           child: child,
//         ),
//       );
//     });
//   }
// }
