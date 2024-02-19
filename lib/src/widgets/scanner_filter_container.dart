import 'package:flutter/material.dart';

class ScannerFilterContainer extends StatelessWidget {

  final Size screenSize;

  const ScannerFilterContainer({
    super.key, 
    required this.screenSize
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenSize.height,
      width: screenSize.width,
      child: ClipPath(
        clipper: MiddleRectHoleClipper(),
        child: Container(
          color: Colors.transparent.withOpacity(0.7),
        ),
      ),
    );
  }
}

class MiddleRectHoleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const holeWidth = 250.0;
    const holeHeight = 250.0;
    final holeLeft = (size.width - holeWidth) / 2;
    final holeTop = (size.height - holeHeight) / 2;

    Path path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRect(Rect.fromLTWH(holeLeft, holeTop, holeWidth, holeHeight))
      ..fillType = PathFillType.evenOdd;
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}