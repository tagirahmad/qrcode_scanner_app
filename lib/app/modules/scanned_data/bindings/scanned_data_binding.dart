import 'package:get/get.dart';

import '../controllers/scanned_data_controller.dart';

class ScannedDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScannedDataController>(
      () => ScannedDataController(),
    );
  }
}
