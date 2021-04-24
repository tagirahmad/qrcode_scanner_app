import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../main.dart';
import '../../../routes/app_pages.dart';

class SplashView extends StatefulWidget {
  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView>
    with AfterLayoutMixin<SplashView> {
  Future checkFirstSeen() async {
    var prefs = await SharedPreferences.getInstance();
    var _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Get.offAndToNamed(Routes.QRCODE_PAGE);
    } else {
      Get.offAndToNamed(Routes.INTRO);
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Splash(),
    );
  }
}
