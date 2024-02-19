import 'package:flutter/material.dart';

class ScannerLineAnimated extends AnimatedWidget {

  final Size screenSize;

  const ScannerLineAnimated({
    Key? key,
    required Animation<double> animation,
    required this.screenSize
  }) : super(
    key: key,
    listenable: animation,
  );

  @override
  Widget build(BuildContext context) {

    final Animation<double> animation = listenable as Animation<double>;
    final scorePosition = (animation.value * 250);

    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 250.0,
        height: 250.0,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: scorePosition,
              left: 0,
              child: Container(
                color: Colors.red,
                width: 250.0,
                height: 2.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 