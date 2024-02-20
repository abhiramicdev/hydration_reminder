import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydration_reminder/screens/reception_screen.dart';
import 'package:hydration_reminder/screens/launch_screen.dart';

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
        fontFamily: 'Nunitos',
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

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const ReceptionScreen(),
        ),
      );
    });

    return const Scaffold(
      body: LaunchBackground(),
    );
  }
}
// ////////////////////////////////////
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SplashScreen(),
//     );
//   }
// }

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   VideoPlayerController? _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset(
//         'assets/animations/water-9677103-7898125.mp4')
//       ..initialize().then((_) {
//         // Once the video has been loaded, play it and set looping to true.
//         _controller?.play();
//         _controller?.setLooping(true);
//         // After the video has been playing for 3 seconds, navigate to the home page.
//         Timer(const Duration(seconds: 3), () {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => const HomePage()),
//           );
//         });
//       });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller?.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Center(
//             child: _controller!.value.isInitialized
//                 ? AspectRatio(
//                     aspectRatio: _controller!.value.aspectRatio,
//                     child: VideoPlayer(_controller!),
//                   )
//                 : const CircularProgressIndicator(),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Home Page')),
//       body: Center(child: Text('Welcome to the home page!')),
//     );
//   }
// }
