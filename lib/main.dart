import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'levels/level.dart';

class GameWorld extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  CameraComponent? cam;

  @override
  Future<void> onLoad() async {
    final level = Level();

    cam = CameraComponent.withFixedResolution(
      world: level,
      width: 1280,
      height: 720,
    );

    cam!.viewfinder.anchor = Anchor.topLeft;

    addAll([cam!, level]);
  }
}

void main() {
  runApp(GameWidget(game: GameWorld()));
}
