import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LaunchBackground extends StatelessWidget {
  const LaunchBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Center(
        child: SizedBox(
          height: 200,
          child: Lottie.asset(
            'assets/animations/xtuhjXszIE.json',
          ),
        ),
      ),
    );
  }
}
