import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrcode_scanner/app/constants/app_colors.dart';
import 'package:qrcode_scanner/app/constants/strings.dart';
import 'package:qrcode_scanner/app/routes/app_pages.dart';

import '../controllers/qrcode_page_controller.dart';

class QrcodePageView extends GetView<QrcodePageController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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

    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            tooltip: Strings.back,
            onPressed: () => Navigator.pop(context),
          )),
      body: SafeArea(
        child: Column(children: <Widget>[
          Expanded(
              flex: 1,
              child: Center(
                  child: Text(
                Strings.pleaseScan,
                style: Theme.of(context).textTheme.headline5,
              ))),
          Expanded(
            flex: 10,
            child: Stack(children: [
              Container(
                color: Colors.transparent.withOpacity(0.5),
                child: QRView(
                  key: GlobalKey(debugLabel: 'QR'),
                  onQRViewCreated: onQRViewCreated,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset('assets/qr_borders.svg',
                    semanticsLabel: 'qr_borders'),
              ),
            ]),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 300, height: 50),
                child: ElevatedButton(
                  child: Text(Strings.flipCamera.toUpperCase(),
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w600)),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      primary: AppColors.PRIMARY),
                  onPressed: () {
                    controller.controller.flipCamera();
                  },
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
