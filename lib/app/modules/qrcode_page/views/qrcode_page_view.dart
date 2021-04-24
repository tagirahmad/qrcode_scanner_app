import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrcode_scanner/app/constants/dimensions.dart';
import 'package:qrcode_scanner/app/constants/links.dart';
import 'package:qrcode_scanner/app/constants/strings.dart';
import 'package:qrcode_scanner/app/modules/qrcode_page/views/scan_content.dart';
import 'package:qrcode_scanner/app/routes/app_pages.dart';
import 'package:qrcode_scanner/app/services/url_launcher_service.dart';

import '../controllers/qrcode_page_controller.dart';
import 'menu_content.dart';

final Uri _emailLaunchUri = Uri(
  scheme: 'mailto',
  path: email,
);

class QrcodePageView extends GetView<QrcodePageController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Map<String, dynamic>> menuItems = [
    {
      'title': 'Visit our website',
      'onTap': () => UrlLauncherService.launchURL(ourWebsite),
    },
    {
      'title': 'E-mail us',
      'onTap': () => UrlLauncherService.launchURL(_emailLaunchUri.toString()),
    },
    {
      'title': 'User Agreement',
      'onTap': () => UrlLauncherService.launchURL(userAgreement),
    },
    {
      'title': 'How to use',
      'onTap': () => UrlLauncherService.launchURL(howToUse),
    },
  ];

  DateTime currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    void onQRViewCreated(
      QRViewController controller,
    ) {
      this.controller.controller = controller;
      controller.scannedDataStream.listen((scanData) {
        this.controller.result = scanData;
        controller.pauseCamera();
        showDialog(
            context: _scaffoldKey.currentContext,
            builder: (context) {
              Future.delayed(Duration(seconds: 1), () {
                Navigator.of(context).pop();
              });
              return AlertDialog(
                title: Center(
                  child: Text(
                    Strings.processing,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                ),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                  ],
                ),
              );
            }).then((value) {
          // controller.resumeCamera();
          Get.toNamed(Routes.SCANNED_DATA, arguments: scanData);
        });
      });
    }

    final List<Widget> bodyContent = [
      ScanContent(
        onQRViewCreated: onQRViewCreated,
      ),
      MenuContent(
        menuItems: menuItems,
      ),
    ];

    Future<bool> onWillPop() {
      DateTime now = DateTime.now();
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime) > Duration(seconds: 2)) {
        currentBackPressTime = now;
        Fluttertoast.showToast(msg: "Tap again to exit");
        return Future.value(false);
      }
      return Future.value(true);
    }

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        body: SafeArea(
            child: Obx(
          () => bodyContent.elementAt(controller.selectedIndex),
        )),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(Dimensions.ITEM_INDENT),
                  child: SvgPicture.asset(
                    "assets/qr_bottom_nav.svg",
                    color: controller.selectedIndex != 1
                        ? Color.fromRGBO(41, 125, 195, 1)
                        : null,
                  ),
                ),
                label: "Scan",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(Dimensions.ITEM_INDENT),
                  child: SvgPicture.asset(
                    "assets/hamburger.svg",
                    color: controller.selectedIndex != 0
                        ? Color.fromRGBO(41, 125, 195, 1)
                        : null,
                  ),
                ),
                label: "Menu",
              ),
            ],
            currentIndex: controller.selectedIndex,
            onTap: (index) => controller.selectedIndex = index,
          ),
        ),
      ),
    );
  }
}
