// import 'package:flutter/material.dart';

// class HomeTabScreen extends StatelessWidget {
//   const HomeTabScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.pink[100],
//       body: Center(
//         child: Glass(),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.blue,
//         onPressed: () {},
//       ),
//     );
//   }
// }

// // class Glass extends StatefulWidget {
// //   @override
// //   State<Glass> createState() => _GlassState();
// // }

// class Glass extends StatefulWidget {
//   final double initialLevel;

//   Glass({required this.initialLevel});
//   @override
//   State<Glass> createState() => _GlassState();
// }

// class _GlassState extends State<Glass> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           width: 100,
//           height: 200,
//           child: CustomPaint(
//             painter: GlassPainter(_currentLevel),
//           ),
//         ),
//         FlatButton(
//           onPressed: _fillGlass,
//           child: Text('Fill Glass'),
//         ),
//       ],
//     );
//   }
// }

// class _GlassState extends State<Glass> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.pink[100],
//       body: Center(
//         child: Container(
//           width: 100,
//           height: 200,
//           child: CustomPaint(
//             painter: GlassPainter(0),
//           ),
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: _GlassState.fillGlass,
//       // ),
//     );
//   }
// }

// class GlassState extends State<Glass> with SingleTickerProviderStateMixin {
//   double _currentLevel = 0;
//   late AnimationController _animationController;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     );
//     _animationController.addListener(() {
//       setState(() {
//         _currentLevel = _animationController.value;
//       });
//     });
//   }

//   void fillGlass() {
//     _animationController.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           width: 100,
//           height: 200,
//           child: CustomPaint(
//             painter: GlassPainter(_currentLevel),
//           ),
//         ),
//         FloatingActionButton.extended(
//           backgroundColor: Colors.red,
//           onPressed: fillGlass,
//           label: Text(
//             'Hi',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         //  FlatButton(
//         //   onPressed: _fillGlass,
//         //   child: Text('Fill Glass'),
//         // ),
//       ],
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
// }

// class GlassPainter extends CustomPainter {
//   final double level;

//   GlassPainter(this.level);

//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint()
//       ..color = Colors.blue
//       ..style = PaintingStyle.fill;

//     var glassPath = Path()
//       ..moveTo(0, size.height * 0.8)
//       ..lineTo(0, size.height)
//       ..lineTo(size.width, size.height)
//       ..lineTo(size.width, size.height * 0.8);

//     canvas.drawPath(glassPath, paint);

//     var waterPath = Path()
//       ..moveTo(0, size.height * 0.8)
//       ..lineTo(0, size.height * (0.8 - level))
//       ..lineTo(size.width * level, size.height * (0.8 - level))
//       ..lineTo(size.width * level, size.height * 0.8)
//       ..lineTo(0, size.height * 0.8);

//     paint.color = Colors.lightBlue;
//     canvas.drawPath(waterPath, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }
