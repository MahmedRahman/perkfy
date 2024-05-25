import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perkfy/app/modules/qr_scan/controllers/qr_scan_controller.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final QRScanController controller = Get.put(QRScanController());
    return Scaffold(
      body: QRView(
        key: controller.qrKey,
        onQRViewCreated: controller.onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: 300,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.back(),
        child: Icon(Icons.close),
      ),
    );
  }
}
