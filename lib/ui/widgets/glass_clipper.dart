import 'dart:math';

import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  final double animationValue;

  WavePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paintGreen = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    final pathGreen = Path();

    pathGreen.moveTo(0, size.height);

    pathGreen.lineTo(0, size.height * 0.6);

    for (var i = 0; i < size.width; i++) {
      final x = i.toDouble();

      final y = size.height * 0.56 +
          animationValue * 30 * sin((i / size.width) * 3 * pi);

      pathGreen.lineTo(x, y);
    }

    pathGreen.lineTo(size.width, size.height);

    pathGreen.close();

    canvas.drawPath(pathGreen, paintGreen);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class WaveAnimation extends StatefulWidget {
  final double heighCounter;
  WaveAnimation({required this.heighCounter});
  @override
  _WaveAnimationState createState() => _WaveAnimationState();
}

class _WaveAnimationState extends State<WaveAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(
            MediaQuery.of(context).size.width,
            widget.heighCounter,
          ),
          painter: WavePainter(_controller.value),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}
