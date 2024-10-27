import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

import 'levels/level.dart';

class GameWorld extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  CameraComponent? cam;
  final Level level = Level();

  @override
  Future<void> onLoad() async {
    cam = CameraComponent.withFixedResolution(
      world: level,
      width: 1280,
      height: 720,
    );

    cam!.viewfinder.anchor = Anchor.topLeft;

    addAll([cam!, level]);
  }
}
