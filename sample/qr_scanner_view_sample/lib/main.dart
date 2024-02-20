import 'package:flutter/material.dart';
import 'package:qr_scanner_view/qr_scanner_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qr Scanner View Sample',
      theme: ThemeData(
        colorSchemeSeed: Colors.purple,
        brightness: Brightness.dark
      ),
      home: const MainPage()
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qr Scanner Sample'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: ((context) => const QrScannerPage())));
          }, 
          child: const Text('Open Qr Scanner')
        ),
      ),
    );
  }
}

//* Qr Scanner page view with desing
class QrScannerPage extends StatelessWidget {
  const QrScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return QrScannerView(
      onResult: (result) {
        debugPrint(result);
      },
    );
  }
}