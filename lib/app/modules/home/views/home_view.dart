import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:qrcode_scanner/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Please, scan the QR code',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 15.0 * 2),
                  SvgPicture.asset('assets/qrcode_logo.svg',
                      semanticsLabel: 'Qr Code Logo'),
                  const SizedBox(height: 15.0 * 2),
                  ConstrainedBox(
                    constraints:
                        BoxConstraints.tightFor(width: 300, height: 50),
                    child: ElevatedButton(
                      onPressed: () => Get.toNamed(Routes.QRCODE_PAGE),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          primary: Color(0xFF297DC3)),
                      child: Text('Scan'.toUpperCase()),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'How the app works?',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
