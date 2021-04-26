import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qrcode_scanner/app/constants/dimensions.dart';
import 'package:qrcode_scanner/app/constants/strings.dart';
import 'package:qrcode_scanner/app/modules/qrcode_page/controllers/qrcode_page_controller.dart';

import '../controllers/scanned_data_controller.dart';

class ScannedDataView extends GetView<ScannedDataController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () async {
        // Get.back();
        QrcodePageController.to.controller.resumeCamera();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              tooltip: Strings.back,
              onPressed: () {
                QrcodePageController.to.controller.resumeCamera();
                Get.back();
              },
            )),
        body: SafeArea(
            child: SingleChildScrollView(
          // padding: EdgeInsets.all(0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset(
              'assets/pfizer.png',
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.all(Dimensions.SIDE_INDENT),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: Dimensions.ITEM_INDENT * 2),
                  Text(
                    'Lipitor',
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(height: Dimensions.ITEM_INDENT),
                  Text(
                    'Pfizer U.S. Pharmaceulicals Gr',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Color(
                          0xFF297DC3,
                        ),
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: Dimensions.ITEM_INDENT * 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Strength(s)",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Imprint(s)",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ]),
                      const SizedBox(width: 15.0),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "10 mg",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(fontWeight: FontWeight.w300),
                            ),
                            const SizedBox(height: Dimensions.ITEM_INDENT),
                            Text(
                              "PD 155 10",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(fontWeight: FontWeight.w300),
                            ),
                          ])
                    ],
                  ),
                  const SizedBox(height: Dimensions.ITEM_INDENT * 2),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pregnancy Category",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: Dimensions.ITEM_INDENT),
                        Text("X - Not for use in pregnancy",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(fontWeight: FontWeight.w300)),
                      ]),
                  const SizedBox(height: Dimensions.ITEM_INDENT * 2),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "CSA Shedule",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: Dimensions.ITEM_INDENT),
                        Text("N - Not a controlled drug Typography",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(fontWeight: FontWeight.w300)),
                      ]),
                  const SizedBox(height: Dimensions.ITEM_INDENT * 2),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: Dimensions.ITEM_INDENT),
                        Text(QrcodePageController.to.result.code,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(fontWeight: FontWeight.w300)),
                      ])
                ],
              ),
            ),
          ]),
        )),
      ),
    );
  }
}
