// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:qr_scanner_view/src/view/qr_scanner_view.dart';

void main() {
  group('QrScannerView', () {
    test('can be instantiated', () {
      expect(QrScannerView(onResult: (value) {},), isNotNull);
    });
  });
}
