import 'package:flutter/material.dart';

import '../game_world.dart';

class WinOverlay extends StatelessWidget {
  final GameWorld game;

  const WinOverlay(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/menu/Ready-to-move_Ganador.png',
            width: MediaQuery.of(context).size.width / 2,
          ),
          ElevatedButton(
            onPressed: () {
              game.overlays.remove('win');
              game.overlays.add('start');
            },
            child: const Text('Volver al inicio!'),
          ),
        ],
      ),
    );
  }
}
