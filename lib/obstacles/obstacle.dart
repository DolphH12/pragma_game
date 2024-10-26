import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Obstacle extends SpriteComponent with HasGameRef, CollisionCallbacks {
  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('elementos/Ready-to-move_Carro-1.png');
    size = Vector2(100, 150);
    position = Vector2(1280 / 2, 720 / 2);

    final shapeHitbox = RectangleHitbox(
      size: Vector2(80, 130),
      position: Vector2(10, 10),
    );

    add(shapeHitbox);
  }
}
