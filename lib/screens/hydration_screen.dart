import 'dart:math';

import 'package:flutter/material.dart';

class MyHydrationScreen extends StatefulWidget {
  const MyHydrationScreen({super.key});

  @override
  State<MyHydrationScreen> createState() => _MyHydrationScreenState();
}

class _MyHydrationScreenState extends State<MyHydrationScreen> {
  double count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (count > 9) {
          } else {
            setState(() {
              count++;
              debugPrint('Add button triggered! $count');
            });
          }
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.pink,
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      child: ClipPath(
                        clipper: GlassTrim(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.lightBlue[200],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: count * 50,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                          height: 10 * 50,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GlassTrim extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double radius = 32;
    Path path = Path()
      ..addRRect(
        RRect.fromLTRBR(
          radius,
          radius,
          radius,
          radius,
          Radius.circular(
            32,
          ),
        ),
      );

    path.moveTo(0, 0);
    path.lineTo(size.width * 0.2, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width * 0.8, size.height);
    path.lineTo(size.width * 0.2, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class GlassShape extends StatelessWidget {
  final double countVal;
  GlassShape({required this.countVal});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Center(
            child: Container(
              // height: 50 * 10,
              color: Colors.greenAccent,
              child: WaveAnimation(
                heighCounter: 50 * countVal - 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Move to the start of the wave.
    path.moveTo(0, size.height * 0.3);

    // Draw the wave using quadratic Bezier curves.
    for (int i = 0; i < 5; i++) {
      var x = size.width / 5 * i;
      var y = size.height * (0.3 + 0.2 * sin((pi / 250) * (50 * x - 2 * 100)));
      // if (i == 0) {
      //   path.lineTo(x, y);
      // } else {
      path.quadraticBezierTo(x, y, x, y);
      // }
    }

    // Draw the final segment of the wave.
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    // Close the path.
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class GlassShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 10); // Move the pen to the point (10, 10)
    path.lineTo(100, 10); // Draw a line from (10, 10) to (100, 10)
    path.lineTo(100, 100); // Draw a line from (100, 10) to (100, 100)
    path.lineTo(10, 100); // Draw a line from (100, 100) to (10, 100)

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
