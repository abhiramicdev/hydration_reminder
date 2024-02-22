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
      backgroundColor: Color.fromARGB(255, 204, 238, 251),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ScreenTitle(
              titleString: 'Profile',
            ),
            Column(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    profileCard(
                      profileInfo: '$weight Kg',
                      animationString:
                          'assets/animations/body_weight_anim.json',
                    ),
                    profileCard(
                      profileInfo: '$age',
                      animationString: 'assets/animations/fgUMTF1Tir.json',
                    ),
                    profileCard(
                      profileInfo: '$gender',
                      animationString: 'assets/animations/gender_anim.json',
                    ),
                  ],
                ),
                SizedBox(height: 20),
                subTitle(
                  text: 'Your water intake should be',
                  textColor: AppColors.purple,
                ),
                SizedBox(height: 8),
                Text(
                  '2120 ml',
                  style: TextStyle(
                    color: Color(0xFF5E389C),
                    fontWeight: FontWeight.w700,
                    fontSize: 21,
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: ScreenSize.getScreenWidth(context) * .45,
                  child: Lottie.asset('assets/animations/glass.json'),
                ),
                spacer12(),
              ],
            ),
            // spacer12(),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.purple),
                ),
                onPressed: () {},
                child: subTitle(
                  text: 'Continue',
                  textColor: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}

class profileCard extends StatelessWidget {
  const profileCard({
    super.key,
    this.profileInfo,
    required this.animationString,
    // required this.weight,
  });

  final String? profileInfo;
  final String animationString;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.purple.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      width: ScreenSize.getScreenWidth(context) / 3.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              spacer12(),
              SizedBox(
                height: 80,
                child: Lottie.asset(animationString),
              ),
              mediumWeightText(
                text: profileInfo ?? '',
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
