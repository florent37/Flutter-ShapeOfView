import 'dart:math';
import 'package:vector_math/vector_math.dart';

import 'package:flutter/material.dart';
import 'package:flutter_shape_of_view/shape_of_view.dart';

enum DiagonalPosition {
  Bottom,
  Top,
  Left,
  Right
}

enum DiagonalDirection {
  Left,
  Right
}

class DiagonalAngle {
  final double angleRadians;

  const DiagonalAngle.radians({double angle = 0}) : angleRadians = angle;

  DiagonalAngle.deg({double angle = 0})
      : this.radians(angle: radians(angle));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DiagonalAngle &&
              runtimeType == other.runtimeType &&
              angleRadians== other.angleRadians;

  @override
  int get hashCode => angleRadians.hashCode;
}


class DiagonalShape extends Shape {
  final DiagonalPosition position;
  final DiagonalDirection direction;
  final DiagonalAngle angle;

  DiagonalShape({
    this.position = DiagonalPosition.Bottom,
    this.direction = DiagonalDirection.Left,
    this.angle = const DiagonalAngle.radians(angle: pi / -20),
  });

  @override
  Path build({Rect rect, double scale}) {
    return generatePath(rect: rect);
  }

  Path generatePath({Rect rect}) {
    final Path path = Path();

    final width = rect.width;
    final height = rect.height;

    final double diagonalAngleRadAbs = this.angle.angleRadians.abs();
    final bool isDirectionLeft = this.direction == DiagonalDirection.Left;
    final double perpendicularHeight = (rect.width * tan(diagonalAngleRadAbs));

    switch (this.position) {
      case DiagonalPosition.Bottom:
        if (isDirectionLeft) {
          path.moveTo(0, 0);
          path.lineTo(width, 0);
          path.lineTo(width, height - perpendicularHeight);
          path.lineTo(0, height);
          path.close();
        } else {
          path.moveTo(width, height);
          path.lineTo(0, height - perpendicularHeight);
          path.lineTo(0, 0);
          path.lineTo(width, 0);
          path.close();
        }
        break;
      case DiagonalPosition.Top:
        if (isDirectionLeft) {
          path.moveTo(width, height);
          path.lineTo(width, 0 + perpendicularHeight);
          path.lineTo(0, 0);
          path.lineTo(0, height);
          path.close();
        } else {
          path.moveTo(width, height);
          path.lineTo(width, 0);
          path.lineTo(0, 0 + perpendicularHeight);
          path.lineTo(0, height);
          path.close();
        }
        break;
      case DiagonalPosition.Right:
        if (isDirectionLeft) {
          path.moveTo(0, 0);
          path.lineTo(width, 0);
          path.lineTo(width - perpendicularHeight, height);
          path.lineTo(0, height);
          path.close();
        } else {
          path.moveTo(0, 0);
          path.lineTo(width - perpendicularHeight, 0);
          path.lineTo(width, height);
          path.lineTo(0, height);
          path.close();
        }
        break;
      case DiagonalPosition.Left:
        if (isDirectionLeft) {
          path.moveTo(0 + perpendicularHeight, 0);
          path.lineTo(width, 0);
          path.lineTo(width, height);
          path.lineTo(0, height);
          path.close();
        } else {
          path.moveTo(0, 0);
          path.lineTo(width, 0);
          path.lineTo(width, height);
          path.lineTo(0 + perpendicularHeight, height);
          path.close();
        }
        break;
    }
    return path;
  }

}