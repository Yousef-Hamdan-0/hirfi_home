import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkInfo {
  final Connectivity connectivity;
  NetworkInfo(this.connectivity);

  Future<bool> get isConnected async {
    ConnectivityResult result = (await connectivity.checkConnectivity()) as ConnectivityResult;
    return result != ConnectivityResult.none;
  }

  static void checkConnectivity(BuildContext context) {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      bool isNotConnected = result == ConnectivityResult.none;
      isNotConnected
          ? const SizedBox()
          : ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        backgroundColor: isNotConnected ? Colors.red : Colors.green,
        duration: Duration(seconds: isNotConnected ? 6000 : 3),
        content: Text(
          isNotConnected ? 'no_connection' : 'connected',
          textAlign: TextAlign.center,
        ),
      ));
    } as void Function(List<ConnectivityResult> event)?);
  }

  // static Future<XFile> compressImage(XFile file) async {
  //   final ImageFile _input = ImageFile(filePath: file.path, rawBytes: await file.readAsBytes());
  //   final Configuration _config = Configuration(
  //     outputType: ImageOutputType.webpThenPng,
  //     useJpgPngNativeCompressor: false,
  //     quality: (_input.sizeInBytes/1048576) < 2 ? 90 : (_input.sizeInBytes/1048576) < 5
  //         ? 50 : (_input.sizeInBytes/1048576) < 10 ? 10 : 1,
  //   );
  //   final ImageFile _output = await compressor.compress(ImageFileConfiguration(input: _input, config: _config));
  //   if(kDebugMode) {
  //     print('Input size : ${_input.sizeInBytes / 1048576}');
  //     print('Output size : ${_output.sizeInBytes / 1048576}');
  //   }
  //   return XFile.fromData(_output.rawBytes);
  // }
}
