import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hydration_reminder/utils/app_colors.dart';
import 'package:hydration_reminder/utils/screen_size.dart';
import 'package:hydration_reminder/utils/screen_title.dart';
import 'package:hydration_reminder/utils/spacer.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    _getProfleData();
    super.initState();
  }

  String? name;
  String? weight;
  String? gender;
  String? age;
  void _getProfleData() async {
    final _prefs = await SharedPreferences.getInstance();

    setState(() {
      name = _prefs.getString('username');
      debugPrint('name is $name');
      weight = _prefs.getString('weight');
      debugPrint('weight is $weight');
      gender = _prefs.getString('gender');
      debugPrint('gender is $gender');
      age = _prefs.getString('age');
      debugPrint('age is $age');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScreenTitle(
              titleString: 'Profile',
            ),
            // SizedBox(
            //   width: ScreenSize.getScreenWidth(context) * .45,
            //   child: Lottie.asset('assets/animations/xtuhjXszIE.json'),
            // ),
            // cardTitle(
            //   title: "Hello $name",
            //   titleColor: AppColors.primary,
            // ),

            // cardTitle(
            //   title: "Your weight is $weight Kg",
            //   titleColor: AppColors.primary,
            // ),
            // spacer12(),
            // cardTitle(
            //   title: "Gender $gender",
            //   titleColor: AppColors.primary,
            // ),
            // spacer12(),
            // cardTitle(
            //   title: "Age $age",
            //   titleColor: AppColors.primary,
            // ),
            // spacer12(),
            Center(
              child: Column(
                children: [
                  spacer12(),
                  SvgPicture.asset(
                    'assets/svgs/female_avatar.svg',
                    height: 100,
                  ),
                  spacer12(),
                  cardTitle(
                    title: 'Abhirami C',
                    titleColor: Color(0xFF6C63FF),
                  ),
                  spacer12(),
                  Column(
                    children: [
                      SizedBox(
                        height: ScreenSize.getScreenWidth(context) / 5,
                        child: Lottie.asset(
                            'assets/animations/body_weight_anim.json'),
                      ),
                      cardTitle(
                        title: '53 Kg',
                        titleColor: AppColors.primary,
                      ),
                    ],
                  ),
                  spacer12(),
                  SizedBox(
                    width: ScreenSize.getScreenWidth(context) * .45,
                    child: Lottie.asset('assets/animations/glass.json'),
                  ),
                ],
              ),
            ),
            spacer12(),
          ],
        ),
      ),
    );
  }
}
