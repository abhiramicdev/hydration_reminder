import 'package:flutter/material.dart';
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
            bottom: 20
            // ScreenSize.getScreenHeight(context) / 24,
            ),
        child: Text(
          titleString,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.lightBlue,
          ),
        ),
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
