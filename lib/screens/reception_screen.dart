import 'package:flutter/material.dart';
import 'package:hydration_reminder/utils/app_colors.dart';
import 'package:hydration_reminder/utils/screen_size.dart';
import 'package:hydration_reminder/utils/screen_title.dart';
import 'package:lottie/lottie.dart';

// Reception screen
/* Tell the user why they will be happy here and what an amazing choice they have made */
class ReceptionScreen extends StatefulWidget {
  const ReceptionScreen({super.key});

  @override
  State<ReceptionScreen> createState() => _ReceptionScreenState();
}

class _ReceptionScreenState extends State<ReceptionScreen> {
  late int tWeekDay;
  @override
  void initState() {
    var date = DateTime.now();
    tWeekDay = date.weekday;
    weekDaySwitcher(tWeekDay);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScreenTitle(
                titleString: 'Happy ${weekDaySwitcher(tWeekDay)}!',
              ),
              InfoCard(
                cardColor: AppColors.primary,
                cardTitle: 'Tell us about yourself!',
                // cardTitle: 'Enter your user anme',
                cardTitlecolor: AppColors.primary600,
                animationString: 'assets/animations/morning_sun_anim.json',
                question: 'Please enter your name',
              ),
              SizedBox(height: 12),
              InfoCard(
                cardColor: Colors.lightBlue.shade100,
                // cardTitle: 'Tell us about yourself!',
                cardTitle: 'Your body weight',
                cardTitlecolor: AppColors.primary600,
                animationString: 'assets/animations/body_weight_anim.json',
                question: 'Enter your body weight in kg',
              ),
              SizedBox(height: 12),
              InfoCard(
                cardColor: Colors.lightGreen.shade200,
                cardTitle: 'Your gender',
                cardTitlecolor: Colors.teal,
                animationString: 'assets/animations/gender_anim.json',
                question: 'Choose your gender',
              ),
              SizedBox(height: 12),
              InfoCard(
                cardColor: Colors.pink.shade100,
                cardTitle: 'Tell us your birthday',
                cardTitlecolor: AppColors.primary600,
                animationString: 'assets/animations/fgUMTF1Tir.json',
                question: 'Pick your birthdate',
              ),
            ],
          ),
        ),
      ),
    );
  }

  String weekDaySwitcher(int weekday) {
    switch (weekday) {
      case 1:
        return "Monday";

      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';

      default:
        return 'Day';
    }
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.cardTitle,
    required this.animationString,
    required this.cardColor,
    required this.cardTitlecolor,
    required this.question,
    // required this.textEditingController,
  });
  final Color cardColor;
  final String cardTitle;
  final Color cardTitlecolor;
  final String animationString;
  final String question;
  // final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 22,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    cardTitle,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: cardTitlecolor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: ScreenSize.getScreenWidth(context) * .45,
              child: Lottie.asset(animationString),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Text(
                question,
                // 'What should Melo call you ?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: TextField(
                // controller: textEditingController,
                cursorColor: AppColors.primary,
                decoration: InputDecoration(
                    focusColor: AppColors.primary,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primary,
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
