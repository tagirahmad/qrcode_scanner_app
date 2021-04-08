import 'package:get/get.dart';
import 'package:qrcode_scanner/app/modules/qrcode_page/controllers/qrcode_page_controller.dart';

class ScannedDataController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    QrcodePageController.to.dispose();
  }

  @override
  void onReady() {
    super.onReady();
    QrcodePageController.to.dispose();
  }

  @override
  void onClose() {}
}
