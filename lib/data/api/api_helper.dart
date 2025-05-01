// import 'dart:convert';
// import 'dart:math';
// // import 'dart:convert';
// // acync*
// // navegatorbar
// // swayp
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:hirfi_home/view/screens/welcome/welcome_viwe.dart';
// import 'package:http/http.dart' as http;
// import 'package:hirfi_home/data/api/api_string.dart';
// import 'package:hirfi_home/util/routes/routes_string.dart';
// // import 'package:hirfi_home/view/screens/welcome/welcome.dart';

// class ApiHelper {
//   static Future<http.Response> post(
//       {required Map<String, dynamic> body,
//       required String url,
//       bool? withToken}) async {
//     Map<String, String> header = withToken == null || withToken == false
//         ? {
//             'Content-type': 'application/json',
//             'Accept': '*/*',
//           }
//         : {
//             'Content-type': 'application/json',
//             'Accept': '*/*',
//             'Authorization': 'Bearer ${ApiString.token}',
//           };
//     http.Response response = await http.post(Uri.parse(url),
//         headers: header, body: jsonEncode(body));
//     OnError(response.statusCode);
//     return response;
//   }

//   static Future<http.Response> patch({
//     required String url,
//     required Map<String, dynamic> body,
//     bool? withToken,
//   }) async {
//     Map<String, String> header = withToken == null || withToken == false
//         ? {
//             'Content-type': 'application/json',
//             'Accept': '*/*',
//           }
//         : {
//             'Content-type': 'application/json',
//             'Accept': '*/*',
//             'Authorization': 'Bearer ${ApiString.token}',
//           };
//     http.Response response = await http.patch(
//       Uri.parse(url),
//       headers: header,
//       body: jsonEncode(body),
//     );
//     OnError(response.statusCode);
//     return response;
//   }

//   static void OnError(int statusCode) {
//     if (statusCode == 404) {
//       Get.snackbar(
//         'خطأ',
//         'العنوان غير موجود (404)',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: const Color(0xFFE57373),
//         colorText: const Color(0xFFFFFFFF),
//       );
//       return;
//     }

//     if (statusCode == 401) {
//       Get.snackbar(
//         'خطأ',
//         'انتهت صلاحية الجلسة، يرجى تسجيل الدخول مجددًا (401)',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: const Color(0xFFFFB74D),
//         colorText: const Color(0xFF000000),
//         duration: const Duration(seconds: 3),
//       );

//       // امسح التوكن أو البيانات المسجلة
//       ApiString.token = '';

//       // انتقل إلى شاشة الترحيب أو تسجيل الدخول
//       Future.delayed(const Duration(seconds: 3), () {
//         Get.offAll(() => const WelcomeViwe());
//       });

//       return;
//     }

//     // رسالة عامة لأي كود خطأ غير مخصص
//     if (statusCode >= 400) {
//       Get.snackbar(
//         'خطأ',
//         'حدث خطأ غير متوقع: $statusCode',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: const Color(0xFFEF9A9A),
//         colorText: const Color(0xFF000000),
//       );
//     }
//   }
// }
