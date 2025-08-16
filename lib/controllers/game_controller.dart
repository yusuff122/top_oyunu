import 'dart:async';
import 'package:flutter/material.dart';
import 'package:top_oyunu/core/constants.dart';
import '../models/game_state.dart';
import 'dart:math';

class GameController extends ChangeNotifier {
  double topY = 300;
  double velocity = 0;
  double gravity = 0.8;
  bool isGameOver = false;
  int score = 0;
  Random random = Random();
  double screenHeight = 600; // default, sonra GameCanvas'tan güncellenecek

  List<ObstacleModel> obstacles = [];
  Timer? gameLoopTimer;

  GameController() {
    startGame();
  }

  void setScreenHeight(double height) {
    screenHeight = height;
  }

  void startGame() {
    isGameOver = false;
    topY = 300;
    velocity = 0;
    score = 0;
    obstacles = [ObstacleModel(x: 400, y: 300)];
    gameLoopTimer = Timer.periodic(const Duration(milliseconds: 30), (_) {
      update();
    });
  }

  void jump() {
    if (!isGameOver) {
      velocity = -12;
    }
  }

  void update() {
    // Top hareketi
    velocity += gravity;
    topY += velocity;

    // Alt sınır
    if (topY > screenHeight - topHeight) {
      topY = screenHeight - topHeight;
      velocity = 0;
    }

    // Üst sınır
    if (topY < 0) {
      topY = 0;
      velocity = 0;
    }

    // Engelleri hareket ettir
    List<ObstacleModel> toRemove = [];
    for (var obs in obstacles) {
      double baseSpeed = 5 + (score / 10);
      double speed = obs.isFast ? baseSpeed * 2 : baseSpeed;
      obs.x -= speed;

      if (obs.x + obstacleWidth < 0) {
        toRemove.add(obs);
        score += 1;
      }

      // Çarpışma kontrolü
      if (obs.x < 50 + topWidth &&
          obs.x + obstacleWidth > 50 &&
          topY + topHeight > obs.y &&
          topY < obs.y + obstacleHeight) {
        gameOver();
      }
    }
    obstacles.removeWhere((obs) => toRemove.contains(obs));

    // Yeni engel oluştur
    if (obstacles.isEmpty || obstacles.last.x < 250) {
      double gapY = random.nextInt((screenHeight - obstacleHeight).toInt()).toDouble();
      bool fast = random.nextInt(5) == 0;
      obstacles.add(ObstacleModel(x: 400, y: gapY, isFast: fast));
    }

    notifyListeners();
  }

  void gameOver() {
    isGameOver = true;
    gameLoopTimer?.cancel();
    notifyListeners();
  }

  void resetGame() {
    startGame();
  }
}
