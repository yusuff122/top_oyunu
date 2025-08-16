import 'package:flutter/material.dart';
import '../widgets/game_canvas.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GameCanvas(),
      ),
    );
  }
}
