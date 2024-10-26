import 'dart:async';

import 'package:flame/components.dart';
import 'package:pragma_game/obstacles/obstacle.dart';

import '../players/player.dart';

class Level extends World with HasGameRef {
  late SpriteComponent background;
  late Player player;
  late Obstacle obstacle;

  @override
  FutureOr<void> onLoad() async {
    background = SpriteComponent(
      sprite: await gameRef.loadSprite('elementos/escenario.png'),
      size: Vector2(1280, 720),
    );

    player = Player();
    obstacle = Obstacle();

    add(background);
    add(obstacle);
    add(player);
  }
}
