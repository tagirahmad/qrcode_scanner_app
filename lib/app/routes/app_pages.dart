import 'package:get/get.dart';

import 'package:qrcode_scanner/app/modules/home/bindings/home_binding.dart';
import 'package:qrcode_scanner/app/modules/home/views/home_view.dart';
import 'package:qrcode_scanner/app/modules/intro/bindings/intro_binding.dart';
import 'package:qrcode_scanner/app/modules/intro/views/intro_view.dart';
import 'package:qrcode_scanner/app/modules/qrcode_page/bindings/qrcode_page_binding.dart';
import 'package:qrcode_scanner/app/modules/qrcode_page/views/qrcode_page_view.dart';
import 'package:qrcode_scanner/app/modules/scanned_data/bindings/scanned_data_binding.dart';
import 'package:qrcode_scanner/app/modules/scanned_data/views/scanned_data_view.dart';
import 'package:qrcode_scanner/app/modules/splash/bindings/splash_binding.dart';
import 'package:qrcode_scanner/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.QRCODE_PAGE,
      page: () => QrcodePageView(),
      binding: QrcodePageBinding(),
    ),
    GetPage(
      name: _Paths.SCANNED_DATA,
      page: () => ScannedDataView(),
      binding: ScannedDataBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.INTRO,
      page: () => IntroView(),
      binding: IntroBinding(),
    ),
  ];
}
