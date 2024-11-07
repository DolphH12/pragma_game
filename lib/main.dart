import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'game_world.dart';
import 'overlays/game_over_overlay.dart';
import 'overlays/start_overlay.dart';
import 'overlays/win_overlay.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();

  runApp(GameWidget(
    game: GameWorld(),
    overlayBuilderMap: {
      'start': (context, GameWorld game) => StartOverlay(game),
      'gameOver': (context, GameWorld game) => GameOverOverlay(game),
      'win': (context, GameWorld game) => WinOverlay(game),
    },
    initialActiveOverlays: const ['start'],
  ));
}
