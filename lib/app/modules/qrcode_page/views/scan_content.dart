import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrcode_scanner/app/constants/strings.dart';

class ScanContent extends StatelessWidget {
  ScanContent({@required this.onQRViewCreated});

  final void Function(QRViewController) onQRViewCreated;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            flex: 3,
            child: Center(
              child: Text(
                Strings.pleaseScan,
                style: Theme.of(context).textTheme.headline5,
              ),
            )),
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
      ],
    );
  }
}
