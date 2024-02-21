import 'package:flutter/material.dart';
import 'package:hydration_reminder/utils/app_colors.dart';
import 'package:hydration_reminder/utils/screen_title.dart';
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

  String? nameis;
  String? weightis;
  String? genderis;
  String? ageis;
  void _getProfleData() async {
    final _prefs = await SharedPreferences.getInstance();
    // _prefs.clear();
    // await _prefs.setString(keyString, valuString);
    nameis = await _prefs.getString('username');
    debugPrint('User username is $nameis');
    weightis = await _prefs.getString('weight');
    debugPrint('User weight is $weightis');
    genderis = await _prefs.getString('gender');
    debugPrint('User gender is $genderis');
    ageis = await _prefs.getString('age');
    debugPrint('User age is $ageis');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ScreenTitle(
            titleString: 'Profile',
          ),
          cardTitle(
            title: 'Name is $nameis',
            titleColor: AppColors.primary,
          )
        ],
      ),
    );
  }
}
