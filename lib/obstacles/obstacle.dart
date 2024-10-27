import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Obstacle extends SpriteComponent with HasGameRef, CollisionCallbacks {
  final Sprite spriteCar;
  final int direction;
  final double positionX;

  Obstacle(
    this.spriteCar,
    this.positionX,
    this.direction,
  );

  @override
  Future<void> onLoad() async {
    sprite = spriteCar;
    size = Vector2(100, 150);

    final shapeHitbox = RectangleHitbox(
      size: Vector2(80, 130),
      position: Vector2(10, 10),
    );

    add(shapeHitbox);
  }

  @override
  void onMount() {
    super.onMount();
    // Posición inicial en la parte superior del carril (puedes ajustar x para el carril)
    position = Vector2(positionX, direction == 1 ? -size.y : 720);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Mueve el carro hacia abajo
    position.y += (200 * dt) * direction;

    // Opcional: Si el carro sale de la pantalla, puedes reiniciar su posición
    if (position.y > 720 && direction == 1) {
      removeFromParent();
    } else if (position.y < 0 && direction == -1) {
      removeFromParent();
    }
  }
}
