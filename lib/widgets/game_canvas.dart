import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'top.dart';
import 'obstacle.dart';
import '../controllers/game_controller.dart';

class GameCanvas extends StatelessWidget {
  const GameCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (_) => GameController()..setScreenHeight(screenHeight),
      child: Consumer<GameController>(
        builder: (context, controller, child) {
          return GestureDetector(
            onTap: controller.jump,
            child: Stack(
              children: [
                // Arka plan
                Container(color: Colors.lightBlue[100]),

                // Top
                Positioned(
                  left: 50,
                  top: controller.topY,
                  child: const Top(),
                ),

                // Engeller
                ...controller.obstacles.map((obs) {
                  return Positioned(
                    left: obs.x,
                    top: obs.y,
                    child: Obstacle(isFast: obs.isFast),
                  );
                }).toList(),

                // Skor
                Positioned(
                  top: 20,
                  left: 20,
                  child: Text(
                    'Skor: ${controller.score}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                // Oyun bitti ekranı
                if (controller.isGameOver)
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Oyun Bitti!\nSkorun: ${controller.score}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: controller.resetGame,
                          child: const Text('Yeniden Başlat'),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
