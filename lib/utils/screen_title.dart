import 'package:flutter/material.dart';
import 'package:hydration_reminder/utils/app_colors.dart';
import 'package:hydration_reminder/utils/screen_size.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({super.key, required this.titleString});
  final String titleString;
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      child: Padding(
        padding: EdgeInsets.only(
            left: 16.0,
            top: ScreenSize.getScreenHeight(context) / 16,
            bottom: 16
            // ScreenSize.getScreenHeight(context) / 24,
            ),
        child: Text(
          titleString,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            // color: Colors.lightBlue,
            color: AppColors.purple,
          ),
        ),
      ),
    );
  }
}

class subTitle extends StatelessWidget {
  const subTitle({
    super.key,
    required this.text,
    this.textColor,
  });
  final String text;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
    );
  }
}

class cardTitle extends StatelessWidget {
  const cardTitle({
    super.key,
    required this.title,
    required this.titleColor,
  });

  final String title;
  final Color titleColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: titleColor,
      ),
    );
  }
}

class mediumWeightText extends StatelessWidget {
  const mediumWeightText({
    super.key,
    required this.text,
    required this.color,
    // required this.fontSize,
  });
  final String text;
  final Color color;
  // final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }
}
