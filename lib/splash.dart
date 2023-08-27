import 'dart:async';
import 'package:flutter/material.dart';
import 'package:manage/home.dart';

class CirclePainter extends CustomPainter {
  final Paint _paint = Paint()
    ..color = Color.fromRGBO(75, 138, 147, 1)
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(Rect.fromLTRB(0, 0, size.width, size.height), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Homepage(),
      ));
    });
  }

  Widget _buildCircle(BuildContext context) {
    return Container(
      width: 280, // Adjust the width based on your image
      height: 290, // Adjust the height based on your image
      child: Stack(
        children: [
          Center(
            child: CustomPaint(
              size: Size(280, 290), // Adjust the size based on your image
              painter: CirclePainter(),
            ),
          ),
          Center(
            child: Image.asset(
              'assets/logo.png',
              width: 280,
              height: 290,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCircle(context), // Use the _buildCircle method here
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 5),
              child: Container(
                child: Text(
                  "LIVIN",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: const Color.fromRGBO(50, 112, 131, 1),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                "plan and live your life",
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: "arial",
                  color: const Color.fromRGBO(50, 112, 131, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}