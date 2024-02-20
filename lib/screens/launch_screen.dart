import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hydration_reminder/utils/app_colors.dart';
import 'package:hydration_reminder/utils/screen_size.dart';
import 'package:lottie/lottie.dart';

class LaunchBackground extends StatelessWidget {
  const LaunchBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Stay hydrated!',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          SizedBox(
            width: ScreenSize.getScreenWidth(context) * .45,
            child: Lottie.asset('assets/animations/xtuhjXszIE.json'),
            
          ),
        ],
      ),
    );
  }
}
