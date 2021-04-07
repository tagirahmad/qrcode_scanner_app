import 'package:get/get.dart';
import 'package:qrcode_scanner/app/modules/qrcode_page/controllers/qrcode_page_controller.dart';

class ScannedDataController extends GetxController {
  //TODO: Implement ScannedDataController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    // QrcodePageController.to.controller.pauseCamera();
    QrcodePageController.to.dispose();
    
  }

  @override
  void onReady() {
    super.onReady();
    // QrcodePageController.to.controller.pauseCamera();
    QrcodePageController.to.dispose();
  }

  @override
  void onClose() {}
}
