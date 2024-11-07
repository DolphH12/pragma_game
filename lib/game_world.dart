import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'levels/level.dart';
import 'players/player.dart';

class GameWorld extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  CameraComponent? cam;
  late JoystickComponent joystick;
  bool showJoystick = true;
  late Level level;
  late Player player;

  @override
  Future<void> onLoad() async {
    await images.loadAllImages();

    player = Player();
    level = Level(player: player);
    cam = CameraComponent.withFixedResolution(
      world: level,
      width: 1280,
      height: 720,
    );

    cam!.viewfinder.anchor = Anchor.topLeft;

    await addJoystick();
    addAll([cam!, level]);
  }

  @override
  void update(double dt) {
    if (showJoystick) {
      level.updateJoystick(joystick);
    }
    super.update(dt);
  }

  Future<void> addJoystick() async {
    joystick = JoystickComponent(
      knob: SpriteComponent(
        sprite: Sprite(
          await images.load('HUD/Knob.png'),
        ),
      ),
      background: SpriteComponent(
        sprite: Sprite(
          await images.load('HUD/Joystick.png'),
        ),
      ),
      margin: const EdgeInsets.only(left: 32, bottom: 32),
    );

    if (showJoystick) {
      add(joystick);
    }
  }
}
