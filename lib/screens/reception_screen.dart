import 'package:flutter/material.dart';
import 'package:hydration_reminder/utils/app_colors.dart';

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
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            'Happy ${weekDaySwitcher(tWeekDay)}!',
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: AppColors.primary600),
          ),

          const Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'What should Melo call you ?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextField(
                    cursorColor: AppColors.primary,
                    decoration: InputDecoration(
                        focusColor: AppColors.primary,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.primary,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          )
          // LottieBuilder.asset(name)
        ],
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
