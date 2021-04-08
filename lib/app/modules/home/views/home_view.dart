import 'package:flutter/material.dart';
import 'package:qrcode_scanner/app/constants/app_colors.dart';
import 'package:qrcode_scanner/app/constants/links.dart';
import 'package:qrcode_scanner/app/constants/strings.dart';
import 'package:url_launcher/url_launcher.dart';
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
                    Strings.pleaseScan,
                    style: Theme.of(context).textTheme.headline5,
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
                          primary: AppColors.PRIMARY),
                      child: Text(
                        Strings.scan.toUpperCase(),
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
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
                  onPressed: _launchURL,
                  child: Text(
                    Strings.howAppWorks,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _launchURL() async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
