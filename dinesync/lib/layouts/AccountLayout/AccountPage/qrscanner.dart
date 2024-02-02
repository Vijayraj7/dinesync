import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:torch_light/torch_light.dart';
import 'package:dinesync/Database/dataposting.dart';
import 'package:dinesync/Theme/appbar.dart';

class QrScannerPage extends StatefulWidget {
  void Function(String s) onload;
  String title;
  QrScannerPage({Key? key, required this.onload, this.title = "Scan Qr"})
      : super(key: key);

  @override
  State<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  String rslt = "";
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  // @override
  // void reassemble() {
  //   super.reassemble();
  //   if (Platform.isAndroid) {
  //     controller!.pauseCamera();
  //   } else if (Platform.isIOS) {
  //     controller!.resumeCamera();
  //   }
  bool istorch = false;
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool istor = false;
          try {
            // istor = await TorchLight.isTorchAvailable();
          } on Exception catch (_) {
            // Handle error
          }
          if (istor == true) {
            istorch = !istorch;
            if (istorch == true) {
              try {
                // await TorchLight.enableTorch();
              } on Exception catch (_) {
                // Handle error
              }
            } else {
              try {
                // await TorchLight.disableTorch();
              } on Exception catch (_) {
                // Handle error
              }
            }
            setState(() {});
          }
        },
        child: Icon(istorch ? Icons.flash_on_rounded : Icons.flash_off_rounded),
      ),
      appBar: appBar(title: widget.title),
      backgroundColor: Colors.black,
      body: Container(
        // padding: EdgeInsets.symmetric(horizontal: 30.w),
        // height: 100.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Positioned.fill(
            //   child:
            Container(
              height: 500.h,
              // flex: 5,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                formatsAllowed: [BarcodeFormat.qrcode],
              ),
            ),
            // ),
            // Positioned.fill(
            //     child: Center(
            //   child: Container(
            //     child: Icon(
            //       Icons.check_box_outline_blank_rounded,
            //       color: Colors.white,
            //       size: 250.w,
            //     ),
            //   ),
            // ))
            // Container(
            //   // flex: 1,
            //   child: Center(
            //     child: (result != null)
            //         ? Text(
            //             'Barcode Type: ${rslt}   Data: ${result!.code}',
            //             style: TextStyle(color: Colors.white),
            //           )
            //         : Text('Scan a code',
            //             style: TextStyle(color: Colors.white)),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.resumeCamera();
    // setState(() {});
    controller.scannedDataStream.listen((scanData) {
      widget.onload(scanData.code ?? '');
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void initState() {
    // setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
