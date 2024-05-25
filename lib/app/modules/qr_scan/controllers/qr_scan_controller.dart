import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class QRScanController extends GetxController {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  var scanResult = Rxn<String>();

  @override
  void onInit() {
    super.onInit();
    checkCameraPermission();
  }

  Future<void> checkCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      await Permission.camera.request();
    }
    // Optionally, handle the case where the user refuses to grant permission
  }

  void onQRViewCreated(QRViewController controller) async {
    this.controller = controller;
    if (await Permission.camera.isGranted) {
      controller.scannedDataStream.listen((scanData) {
        scanResult.value = scanData.code;
        if (scanData.code != null) {
          Get.back(result: scanData.code); // Return the result and close the scanner screen
        }
      });
    } else {
      Get.snackbar("Permissions error", "Camera permission is required to scan QR codes");
    }
  }

  @override
  void onClose() {
    controller?.dispose();
    super.onClose();
  }
}
