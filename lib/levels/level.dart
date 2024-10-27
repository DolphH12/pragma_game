import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:pragma_game/obstacles/obstacle.dart';

import '../obstacles/win.dart';
import '../players/player.dart';

class Level extends World with HasGameRef {
  final Random _random = Random();
  late SpriteComponent background;
  late Player player;
  late Obstacle obstacle;
  late Win win;
  late TextComponent lifeText;
  int playerLives = 3;
  bool isGameOver = false;

  final List<String> carImagesCarril1 = [
    'elementos/Ready-to-move_Carro-1.png',
    'elementos/Ready-to-move_Carro-3.png',
  ];
  final List<String> carImagesCarril2 = [
    'elementos/Ready-to-move_Carro-2.png',
    'elementos/Ready-to-move_Autobus.png',
    'elementos/Ready-to-move_Tractor.png',
    'elementos/Ready-to-move_Tractor-2.png',
  ];
  final List<double> carrilPosition1 = [
    310,
    390,
  ];
  final List<double> carrilPosition2 = [
    730,
    820,
  ];

  Future<void> startGame() async {
    resetGame();
    game.overlays.remove('start');
    game.overlays.remove('gameOver');

    game.resumeEngine();
    playerLives = 3;
    lifeText = TextComponent(
      text: 'Vida: $playerLives',
      position: Vector2(1100, 10),
      textRenderer: TextPaint(
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          shadows: [
            Shadow(
              color: Colors.black,
              offset: Offset(2, 2),
              blurRadius: 5,
            ),
          ],
        ),
      ),
    );

    background = SpriteComponent(
      sprite: await gameRef.loadSprite('elementos/escenario.png'),
      size: Vector2(1280, 720),
    );

    player = Player(verifyLife);
    win = Win();

    add(background);
    add(win);

    add(TimerComponent(
      period: 2,
      repeat: true,
      onTick: spawnCarCarril1,
    ));

    add(TimerComponent(
      period: 1.5,
      repeat: true,
      onTick: spawnCarCarril2,
    ));

    add(lifeText);
    add(player);
  }

  @override
  Future<void> onLoad() async {
    game.overlays.add('start');
  }

  void resetGame() {
    removeAll(children.toList());
  }

  void verifyLife() {
    playerLives--;
    lifeText.text = 'Vida: $playerLives'; // Actualiza el texto de vidas
    if (playerLives <= 0) {
      game.pauseEngine();
      gameOver();
    }
  }

  void gameOver() {
    isGameOver = true;
    game.overlays.add('gameOver');
  }

  Future<void> spawnCarCarril1() async {
    // Elegir aleatoriamente un carril y una imagen
    final laneIndex = _random.nextInt(carrilPosition1.length);
    final imageIndex = _random.nextInt(carImagesCarril1.length);

    // Cargar el sprite del carro
    final carSprite = await game.loadSprite(carImagesCarril1[imageIndex]);

    // Crear el componente del carro y establecer su posición
    final car = Obstacle(carSprite, carrilPosition1[laneIndex], 1);

    add(car); // Agregar el carro al juego
  }

  Future<void> spawnCarCarril2() async {
    // Elegir aleatoriamente un carril y una imagen
    final laneIndex = _random.nextInt(carrilPosition2.length);
    final imageIndex = _random.nextInt(carImagesCarril2.length);

    // Cargar el sprite del carro
    final carSprite = await game.loadSprite(carImagesCarril2[imageIndex]);

    // Crear el componente del carro y establecer su posición
    final car = Obstacle(carSprite, carrilPosition2[laneIndex], -1);

    add(car); // Agregar el carro al juego
  }
}
