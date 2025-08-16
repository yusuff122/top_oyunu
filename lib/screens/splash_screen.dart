import 'package:flutter/material.dart';
import 'game_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const GameScreen()),
      );
    });

    return Scaffold(
      body: Center(
        child: Text(
          'ZıpZıp Top',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}
