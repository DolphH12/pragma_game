import 'package:flutter/material.dart';

import '../game_world.dart';

class GameOverOverlay extends StatelessWidget {
  final GameWorld game;

  const GameOverOverlay(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/menu/Ready-to-move_intentar.png',
            width: MediaQuery.of(context).size.width / 2,
          ),
          ElevatedButton(
            onPressed: () {
              game.level.startGame(); // Reinicia el juego
            },
            child: const Text('Reiniciar Juego'),
          ),
        ],
      ),
    );
  }
}
