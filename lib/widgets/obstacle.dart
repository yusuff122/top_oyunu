import 'package:flutter/material.dart';
import 'package:top_oyunu/core/constants.dart';
import '../models/game_state.dart';
class Obstacle extends StatelessWidget {
  final bool isFast;
  const Obstacle({super.key, required this.isFast});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: obstacleWidth,
      height: obstacleHeight,
      color: isFast ? Colors.red : Colors.green,
    );
  }
}
