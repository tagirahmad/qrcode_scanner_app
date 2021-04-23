import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:screen/screen.dart';

class QrcodePageController extends GetxController {
  static QrcodePageController get to => Get.find();

  Barcode result;
  QRViewController controller;

  final _selectedIndex = 0.obs;
  
  get selectedIndex => _selectedIndex.value;
  set selectedIndex(index) => _selectedIndex.value = index;

  @override
  void onInit() async {
    super.onInit();
    await initPlatformState();
  }

  @override
  void onReady() async {
    super.onReady();
    await initPlatformState();
  }

  @override
  void onClose() async {
    controller?.pauseCamera();
    controller.dispose();
    await Screen.setBrightness(0.5);
  }

  initPlatformState() async {
    Screen.keepOn(true);
    Screen.setBrightness(1.0);
  }
}
