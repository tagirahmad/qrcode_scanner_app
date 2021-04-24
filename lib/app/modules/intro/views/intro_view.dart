import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:qrcode_scanner/app/constants/app_colors.dart';
import 'package:qrcode_scanner/app/constants/dimensions.dart';
import 'package:qrcode_scanner/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/intro_controller.dart';

class IntroView extends GetView<IntroController> {
  static CarouselController buttonCarouselController = CarouselController();

  final List<Map<String, dynamic>> carouselItems = [
    {
      "imagePath": "assets/lens_with_phone.svg",
      "title": "Prepare your camera",
      "subtitle":
          "For better QR code reading, you need to put the lense on the main сamera",
      "buttonText": "NEXT",
      "onPressed": () {
        Get.put(IntroController())..current.value = 1;
      }
    },
    {
      "imagePath": "assets/vitamin.svg",
      "title": "Scan the QR code",
      "subtitle": "Point the camera at the QR code and wait for the result",
      "buttonText": "SCAN QR",
      "onPressed": () async {
        var prefs = await SharedPreferences.getInstance();
        await prefs.setBool('seen', true);
        Get.offAndToNamed(Routes.QRCODE_PAGE);
      }
    },
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Obx(
            () => Stack(
              children: [
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: Dimensions.ITEM_INDENT * 3,
                        ),
                        SvgPicture.asset(
                          controller.current.value == 0
                              ? carouselItems[0]['imagePath']
                              : carouselItems[1]['imagePath'],
                          semanticsLabel: '',
                          height: 210,
                          width: 210,
                        ),
                        const SizedBox(
                          height: Dimensions.ITEM_INDENT * 3,
                        ),
                        Text(
                          controller.current.value == 0
                              ? carouselItems[0]['title']
                              : carouselItems[1]['title'],
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: Dimensions.ITEM_INDENT * 2,
                        ),
                        Text(
                          controller.current.value == 0
                              ? carouselItems[0]['subtitle']
                              : carouselItems[1]['subtitle'],
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: Dimensions.ITEM_INDENT * 3,
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tightFor(width: 250, height: 50),
                          child: ElevatedButton(
                            onPressed: controller.current.value == 0
                                ? carouselItems[0]['onPressed']
                                : carouselItems[1]['onPressed'],
                            // onPressed: () => buttonCarouselController.nextPage(
                            //     duration: Duration(milliseconds: 300),
                            //     curve: Curves.linear)),
                            child: Text(
                              controller.current.value == 0
                                  ? carouselItems[0]['buttonText']
                                  : carouselItems[1]['buttonText'],
                            ),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                primary: AppColors.PRIMARY),
                          ),
                        ),
                        // const SizedBox(
                        //   height: Dimensions.ITEM_INDENT * 15,
                        // ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: Dimensions.SIDE_INDENT * 2,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: carouselItems.map(
                      (url) {
                        int index = carouselItems.indexOf(url);
                        return Container(
                          width: 60.0,
                          height: 2.0,
                          margin: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 8.0,
                          ),
                          color: controller.current.value == index
                              ? Color.fromRGBO(41, 125, 195, 0.9)
                              : Color.fromRGBO(41, 125, 195, 0.4),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             const SizedBox(
//                               height: Dimensions.ITEM_INDENT * 3,
//                             ),
//                             SvgPicture.asset(
//                               i['imagePath'],
//                               semanticsLabel: '',
//                               height: 210,
//                               width: 210,
//                             ),
//                             const SizedBox(
//                               height: Dimensions.ITEM_INDENT * 3,
//                             ),
//                             Text(
//                               i['title'],
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headline5
//                                   .copyWith(fontWeight: FontWeight.bold),
//                               textAlign: TextAlign.center,
//                             ),
//                             const SizedBox(
//                               height: Dimensions.ITEM_INDENT * 2,
//                             ),
//                             Text(
//                               i['subtitle'],
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodyText2
//                                   .copyWith(fontWeight: FontWeight.w300),
//                               textAlign: TextAlign.center,
//                             ),
//                             const SizedBox(
//                               height: Dimensions.ITEM_INDENT * 3,
//                             ),
//                             ConstrainedBox(
//                               constraints: BoxConstraints.tightFor(
//                                   width: 250, height: 50),
//                               child: ElevatedButton(
//                                 onPressed: i['onPressed'],
//                                 // onPressed: () => buttonCarouselController.nextPage(
//                                 //     duration: Duration(milliseconds: 300),
//                                 //     curve: Curves.linear),
//                                 child: Text(
//                                   i['buttonText'],
//                                 ),
//                                 style: ElevatedButton.styleFrom(
//                                     padding:
//                                         EdgeInsets.symmetric(horizontal: 30),
//                                     primary: AppColors.PRIMARY),
//                               ),
//                             ),
//                             // const SizedBox(
//                             //   height: Dimensions.ITEM_INDENT * 15,
//                             // ),
//                             Positioned(
//                               bottom: 30,
//                               left: 0,
//                               right: 0,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: carouselItems.map((url) {
//                                   int index = carouselItems.indexOf(url);
//                                   return Container(
//                                     width: 60.0,
//                                     height: 2.0,
//                                     margin: EdgeInsets.symmetric(
//                                       vertical: 10.0,
//                                       horizontal: 8.0,
//                                     ),
//                                     color: controller.current.value == index
//                                         ? Color.fromRGBO(41, 125, 195, 0.9)
//                                         : Color.fromRGBO(41, 125, 195, 0.4),
//                                   );
//                                 }).toList(),
//                               ),
//                             ),
//                           ],
//                         ),
