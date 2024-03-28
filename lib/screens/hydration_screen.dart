import 'package:flutter/material.dart';
import 'package:hydration_reminder/ui/widgets/glass_clipper.dart';

class MyHydrationScreen extends StatefulWidget {
  final double screenHeight;
  const MyHydrationScreen({super.key, required this.screenHeight});

  @override
  State<MyHydrationScreen> createState() => _MyHydrationScreenState();
}

class _MyHydrationScreenState extends State<MyHydrationScreen> {
  int waterRqd = 2100;
  int unitWaterShort = 150;
  double count = 0;
  double stepsToFill = 0;
  late double stepHeight;
  int currentHydrationPrcnt = 0;
  int currentWaterIntake = 0;

  late double glassMaxHeight;
  @override
  void initState() {
    // Max Glass Const height = half the screen height
    glassMaxHeight = widget.screenHeight / 2;
    double steps = waterRqd / unitWaterShort;
    stepsToFill = steps.ceil().toDouble();
    debugPrint('Steps: $stepsToFill');
    stepHeight = glassMaxHeight / steps;
    debugPrint("Hi HeightL  $stepHeight");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (count > stepsToFill - 1) {
              debugPrint('Here $count && $stepsToFill');
            } else {
              count++;
              debugPrint('Add button triggered! $count');
              setState(() {
                currentWaterIntake =
                    ((count * (waterRqd / stepsToFill)).round().ceil()).toInt();
                currentHydrationPrcnt = count * 100 ~/ stepsToFill;
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$currentWaterIntake ml',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Today you are $currentHydrationPrcnt% hydrated',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 45),
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
                                height: count * stepHeight,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                          height: glassMaxHeight,
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
