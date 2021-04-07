import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:screen/screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    super.initState();
    initPlatformState();
  }

  initPlatformState() async {
    Screen.keepOn(true);
    Screen.setBrightness(1.0);
  }

  Barcode result;
  QRViewController controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Med scan'.toUpperCase(),
              style: TextStyle(color: Colors.black),
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Your Result: ${result?.code} \n${result?.format}"),
                  Container(
                    // color: Colors.white,
                    // height: 200,
                    child: ElevatedButton(
                      child: Text('Flip camera'),
                      onPressed: () {
                        controller?.flipCamera();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: QRView(
              key: GlobalKey(debugLabel: 'QR'),
              onQRViewCreated: _onQRViewCreated,
            ),
          )
        ]),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.flipCamera();
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String _scanBarcode = 'Unknown';

//   @override
//   void initState() {
//     super.initState();
//   }

//   Future<void> startBarcodeScanStream() async {
//     FlutterBarcodeScanner.getBarcodeStreamReceiver(
//             '#ff6666', 'Cancel', true, ScanMode.BARCODE)
//         .listen((barcode) => print(barcode));
//   }

//   Future<void> scanQR() async {
//     String barcodeScanRes;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.QR);
//       print(barcodeScanRes);
//     } on PlatformException {
//       barcodeScanRes = 'Failed to get platform version.';
//     }

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;

//     setState(() {
//       _scanBarcode = barcodeScanRes;
//     });
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> scanBarcodeNormal() async {
//     String barcodeScanRes;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.BARCODE);
//       print(barcodeScanRes);
//     } on PlatformException {
//       barcodeScanRes = 'Failed to get platform version.';
//     }

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;

//     setState(() {
//       _scanBarcode = barcodeScanRes;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             appBar: AppBar(title: const Text('Barcode scan')),
//             body: Builder(builder: (BuildContext context) {
//               return Container(
//                   alignment: Alignment.center,
//                   child: Flex(
//                       direction: Axis.vertical,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         RaisedButton(
//                             onPressed: () => scanBarcodeNormal(),
//                             child: Text('Start barcode scan')),
//                         RaisedButton(
//                             onPressed: () => scanQR(),
//                             child: Text('Start QR scan')),
//                         RaisedButton(
//                             onPressed: () => startBarcodeScanStream(),
//                             child: Text('Start barcode scan stream')),
//                         Text('Scan result : $_scanBarcode\n',
//                             style: TextStyle(fontSize: 20))
//                       ]));
//             })));
//   }
// }

// import 'dart:async';

// import 'package:barcode_scan/barcode_scan.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// void main() {
//   runApp( MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() =>  _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String barcode = "";

//   @override
//   initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//       home:  Scaffold(
//           appBar:  AppBar(
//             title:  Text('Barcode Scanner Example'),
//           ),
//           body:  Center(
//             child:  Column(
//               children: <Widget>[
//                  Container(
//                   child:  MaterialButton(
//                       onPressed: scan, child:  Text("Scan")),
//                   padding: const EdgeInsets.all(8.0),
//                 ),
//                  Text(barcode),
//               ],
//             ),
//           )),
//     );
//   }

//   Future scan() async {
//     try {
//       String barcode = await BarcodeScanner.scan();
//       setState(() => this.barcode = barcode);
//     } on PlatformException catch (e) {
//       if (e.code == BarcodeScanner.CameraAccessDenied) {
//         setState(() {
//           this.barcode = 'The user did not grant the camera permission!';
//         });
//       } else {
//         setState(() => this.barcode = 'Unknown error: $e');
//       }
//     } on FormatException{
//       setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
//     } catch (e) {
//       setState(() => this.barcode = 'Unknown error: $e');
//     }
//   }
// }
