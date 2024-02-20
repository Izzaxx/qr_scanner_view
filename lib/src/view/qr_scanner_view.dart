import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:qr_scanner_view/src/widgets/scanner_line_animated.dart';
import 'package:qr_scanner_view/src/widgets/scanner_filter_container.dart';

class QrScannerView extends StatefulWidget {

  final ValueChanged onResult;
  final List<BarcodeFormat>? formatsAllowed;
  final String? text;

  const QrScannerView({
    super.key, 
    required this.onResult,
    this.formatsAllowed,
    this.text,
  });

  @override
  State<QrScannerView> createState() => _QrScannerViewState();
}

class _QrScannerViewState extends State<QrScannerView> with TickerProviderStateMixin {

  late AnimationController _animationController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool isDoOnce = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(seconds: 1), vsync: this);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animateScanAnimation(true);
      } else if (status == AnimationStatus.dismissed) {
        animateScanAnimation(false);
      }
    });

    _animationController.forward(from: 0.0);
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }


  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void animateScanAnimation(bool reverse) {
    if (reverse) {
      _animationController.reverse(from: 1.0);
    } else {
      _animationController.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery.of(context).size;

    if (result != null && !isDoOnce) {
      isDoOnce = true;
      SchedulerBinding.instance.addPostFrameCallback((_) {
        final String resultQr = result!.code!;
        widget.onResult(resultQr);
      });
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: [
                  QRView(
                    key: qrKey,
                    formatsAllowed: widget.formatsAllowed ?? <BarcodeFormat>[],
                    onQRViewCreated: _onQRViewCreated,
                  ),
                  SizedBox(
                    height: screenSize.height,
                    width: screenSize.width,
                    child: ClipPath(
                      clipper: MiddleRectHoleClipper(),
                      child: Container(
                        color: Colors.transparent.withOpacity(0.7),
                      ),
                    ),
                  ),
                  ScannerLineAnimated(
                    animation: _animationController,
                    screenSize: screenSize,
                  ),
                  Visibility(
                    visible: widget.text != null,
                    child: Align(
                      alignment: Alignment.center,
                      child: FractionalTranslation(
                        translation: const Offset(0, 4),
                        child: SizedBox(
                          width: 200,
                          child: Text(
                            widget.text ?? '', 
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      }, 
                      icon: Icon(
                        Icons.close,
                        size: 40.0,
                        color: Colors.white,
                      )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}