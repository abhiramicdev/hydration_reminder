import 'package:flutter/material.dart';
import 'package:hydration_reminder/screens/profile_screen.dart';
import 'package:hydration_reminder/utils/app_colors.dart';
import 'package:hydration_reminder/utils/screen_size.dart';
import 'package:hydration_reminder/utils/screen_title.dart';
import 'package:hydration_reminder/utils/spacer.dart';
import 'package:hydration_reminder/utils/week_day.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Reception screen
/* Tell the user why they will be happy here and what an amazing choice they have made */
class ReceptionScreen extends StatefulWidget {
  const ReceptionScreen({super.key});

  @override
  State<ReceptionScreen> createState() => _ReceptionScreenState();
}

class _ReceptionScreenState extends State<ReceptionScreen> {
  final _formKey = GlobalKey<FormState>();
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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ScreenTitle(
                  titleString: 'Happy ${weekDaySwitcher(tWeekDay)}!',
                ),

                // Name to be stored in sharedpreference
                InfoCard(
                  cardColor: AppColors.primary,
                  cardTitle: 'Tell us about yourself!',
                  // cardTitle: 'Enter your user anme',
                  cardTitlecolor: AppColors.primary600,
                  animationString: 'assets/animations/morning_sun_anim.json',
                  question: 'Please enter your name', keyType: 'username',
                ),
                spacer12(),
                //Weight is required to evaluate water nitake
                // todo: Add suffix text Kg
                InfoCard(
                  cardColor: Colors.lightBlue.shade100,
                  // cardTitle: 'Tell us about yourself!',
                  cardTitle: 'Your body weight',
                  cardTitlecolor: AppColors.primary600,
                  animationString: 'assets/animations/body_weight_anim.json',
                  question: 'Enter your body weight in kg', keyType: 'weight',
                ),
                spacer12(),
                //Gender is rgq to evaluate water intake
                // TODO: Add gender dropdown or wheel
                InfoCard(
                  cardColor: Colors.lightGreen.shade200,
                  cardTitle: 'Your gender',
                  cardTitlecolor: Colors.teal,
                  animationString: 'assets/animations/gender_anim.json',
                  question: 'Choose your gender',
                  keyType: 'gender',
                ),
                spacer12(),
                //Age is rqd to evaluate water intake
                //TODO : add DATE PICKER AND CONVERT TO STRING
                InfoCard(
                  cardColor: Colors.pink.shade100,
                  cardTitle: 'Tell us your birthday',
                  cardTitlecolor: AppColors.primary600,
                  animationString: 'assets/animations/fgUMTF1Tir.json',
                  question: 'Pick your birthdate',
                  keyType: 'age',
                ),
                spacer12(),
                ElevatedButton(
                  child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('Processing Data'),
                        ),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ProfileScreen(),
                        ),
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      AppColors.primary700,
                    ),
                  ),
                ),
                spacer12(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatefulWidget {
  const InfoCard({
    super.key,
    required this.cardTitle,
    required this.animationString,
    required this.cardColor,
    required this.cardTitlecolor,
    required this.question,
    required this.keyType,
  });
  final Color cardColor;
  final String cardTitle;
  final Color cardTitlecolor;
  final String animationString;
  final String question;
  final String keyType;

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.cardColor,
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
                  child: cardTitle(
                    title: widget.cardTitle,
                    titleColor: widget.cardTitlecolor,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: ScreenSize.getScreenWidth(context) * .45,
              child: Lottie.asset(widget.animationString),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: subTitle(text: widget.question),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: TextFormField(
                controller: textEditingController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your ${widget.keyType}';
                  } else {
                    // TODO: Add username conditions
                    _saveData(
                        widget.keyType.toString(), textEditingController.text);
                    return null;
                  }
                },
                cursorColor: AppColors.primary900,
                decoration: InputDecoration(
                    // focusColor: AppColors.primary900,
                    focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primary900,
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveData(String keyString, String valuString) async {
    final _prefs = await SharedPreferences.getInstance();
    // _prefs.clear();
    await _prefs.setString(keyString, valuString);
    var nameis = await _prefs.getString(keyString);
    debugPrint('User $keyString is $nameis');
  }
}
