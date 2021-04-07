import 'package:get/get.dart';

import '../controllers/qrcode_page_controller.dart';

class QrcodePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrcodePageController>(
      () => QrcodePageController(),
    );
  }
}
