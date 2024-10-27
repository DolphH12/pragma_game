import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:pragma_game/obstacles/obstacle.dart';
import 'package:pragma_game/obstacles/win.dart';

class Player extends SpriteAnimationGroupComponent
    with HasGameRef, KeyboardHandler, CollisionCallbacks {
  Player(this.verifyLife);

  final VoidCallback verifyLife;
  Vector2 velocity = Vector2.zero();
  Vector2 movement = Vector2.zero();

  @override
  Future<void> onLoad() async {
    await _loadAnimations();

    size = Vector2(100, 100);
    position = Vector2(50, game.size.y / 2);

    final shapeHitbox = RectangleHitbox(
      size: Vector2(50, 100),
      position: Vector2(20, 0),
    );

    add(shapeHitbox);
  }

  Future<void> _loadAnimations() async {
    final idleFrames = [
      await gameRef.loadSprite('personaje/Personaje-F0.png'),
      await gameRef.loadSprite('personaje/Personaje-F0.png'),
      await gameRef.loadSprite('personaje/Personaje-F0.png'),
    ];

    final runFrames = [
      await gameRef.loadSprite('personaje/Personaje-F1.png'),
      await gameRef.loadSprite('personaje/Personaje-F2.png'),
      await gameRef.loadSprite('personaje/Personaje-F5.png'),
      await gameRef.loadSprite('personaje/Personaje-F4.png'),
      await gameRef.loadSprite('personaje/Personaje-F3.png'),
    ];

    animations = {
      'idle': SpriteAnimation.spriteList(idleFrames, stepTime: 0.1),
      'run': SpriteAnimation.spriteList(runFrames, stepTime: 0.2),
    };

    current = 'idle';
  }

  @override
  void update(double dt) {
    super.update(dt);
    _updateAnimation();
    _updateMovement(dt);
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    movement = Vector2.zero();

    if (keysPressed.contains(LogicalKeyboardKey.arrowUp)) {
      movement.y += -1;
    } else if (keysPressed.contains(LogicalKeyboardKey.arrowDown)) {
      movement.y += 1;
    } else if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      movement.x += -1;
    } else if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      movement.x += 1;
    }

    return super.onKeyEvent(event, keysPressed);
  }

  void _updateMovement(double dt) {
    velocity = movement * 200;
    position += velocity * dt;
  }

  void _updateAnimation() {
    if (velocity != Vector2.zero()) {
      if (velocity.x < 0 && scale.x > 0) {
        flipHorizontallyAroundCenter();
      } else if (velocity.x > 0 && scale.x < 0) {
        flipHorizontallyAroundCenter();
      }
      current = 'run';
    } else {
      current = 'idle';
    }
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is Obstacle) {
      verifyLife();
      position = Vector2(50, game.size.y / 2);
    }
    if (other is Win) {
      game.pauseEngine();
      game.overlays.add('win');
    }
  }
}
