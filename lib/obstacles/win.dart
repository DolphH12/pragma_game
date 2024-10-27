import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Win extends PositionComponent with HasGameRef, CollisionCallbacks {
  final _defaultColor = Colors.transparent;
  late Paint defaultPaint;
  @override
  Future<void> onLoad() async {
    size = Vector2(110, 50);
    position = Vector2(1060, 370);
    defaultPaint = Paint()
      ..color = _defaultColor
      ..style = PaintingStyle.fill;

    add(RectangleHitbox());
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(size.toRect(), defaultPaint);
  }
}
