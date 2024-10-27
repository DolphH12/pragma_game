import 'package:flutter/material.dart';

import '../game_world.dart';

class StartOverlay extends StatelessWidget {
  final GameWorld game;

  const StartOverlay(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/menu/Ready-to-move_Nombre.png',
            width: MediaQuery.of(context).size.width / 2,
          ),
          ElevatedButton(
            onPressed: () {
              game.level.startGame();
            },
            child: const Text('Iniciar Juego'),
          ),
        ],
      ),
    );
  }
}
