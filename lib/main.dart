import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydration_reminder/screens/profile_screen.dart';
import 'package:hydration_reminder/screens/reception_screen.dart';
import 'package:hydration_reminder/screens/launch_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hydration Tracker',
      theme: ThemeData(
        useMaterial3: true,
        // fontFamily: 'Nunitos',
        primarySwatch: const MaterialColor(0xFF4CC9F0, {
          50: Color(0xFF4CC9F0),
          100: Color(0xFF49C8E7),
          200: Color(0xFF43C6DB),
          300: Color(0xFF3CC3D1),
          400: Color(0xFF2996D0),
          500: Color(0xFF2283CA),
          600: Color(0xFF1B70C4),
          700: Color(0xFF155DDD),
          800: Color(0xFF0F4AD8),
          900: Color(0xFF0F4AD8),
        }),
      ),
      home: const SplashScreen(),
      builder: (context, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          child: child!,
        );
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? nameis;

  @override
  void initState() {
    checkExistingUser();
    super.initState();
  }

  checkExistingUser() async {
    final _prefs = await SharedPreferences.getInstance();
    setState(() {
      nameis = _prefs.getString('username');
      debugPrint("NAME IS $nameis");
    });
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) =>
              nameis != null ? const ProfileScreen() : ReceptionScreen(),
        ),
      );
    });

    return const Scaffold(
      body: LaunchBackground(),
    );
  }
}
