import 'package:flutter/material.dart';
import 'package:shape_of_view/shape_of_view.dart';

enum ArcPosition { Bottom, Top, Left, Right }
enum ArcDirection { Outside, Inside }

class ArcShape extends Shape {
  final ArcPosition position;
  final double height;
  final ArcDirection direction;

  ArcShape({
    this.position = ArcPosition.Bottom,
    this.direction = ArcDirection.Outside,
    this.height = 10,
  });

  @override
  Path build({Rect rect, double scale}) {
    return generatePath(rect, scale);
  }

  Path generatePath(Rect rect, double scale) {
    final size = rect.size;
    switch (this.position) {
      case ArcPosition.Top:
        if (direction == ArcDirection.Outside) {
          return Path()
            ..moveTo(0.0, height)
            ..quadraticBezierTo(size.width / 4, 0.0, size.width / 2, 0.0)
            ..quadraticBezierTo(size.width * 3 / 4, 0.0, size.width, height)
            ..lineTo(size.width, size.height)
            ..lineTo(0.0, size.height)
            ..close();
        } else {
          return Path()
            ..quadraticBezierTo(size.width / 4, height, size.width / 2, height)
            ..quadraticBezierTo(size.width * 3 / 4, height, size.width, 0.0)
            ..lineTo(size.width, size.height)
            ..lineTo(0.0, size.height)
            ..close();
        }
        break;
      case ArcPosition.Bottom:
        if (direction == ArcDirection.Outside) {
          return Path()
            ..lineTo(0.0, size.height - height)
            ..quadraticBezierTo(size.width / 4, size.height, size.width / 2, size.height)
            ..quadraticBezierTo(size.width * 3 / 4, size.height, size.width, size.height - height)
            ..lineTo(size.width, 0.0)
            ..close();
        } else {
          return Path()
            ..moveTo(0.0, size.height)
            ..quadraticBezierTo(size.width / 4, size.height - height, size.width / 2, size.height - height)
            ..quadraticBezierTo(size.width * 3 / 4, size.height - height, size.width, size.height)
            ..lineTo(size.width, 0.0)
            ..lineTo(0.0, 0.0)
            ..close();
        }
        break;
      case ArcPosition.Left:
        if (direction == ArcDirection.Outside) {
          return Path()
            ..moveTo(height, 0.0)
            ..quadraticBezierTo(0.0, size.height / 4, 0.0, size.height / 2)
            ..quadraticBezierTo(0.0, size.height * 3 / 4, height, size.height)
            ..lineTo(size.width, size.height)
            ..lineTo(size.width, 0.0)
            ..close();
        } else {
          return Path()
            ..quadraticBezierTo(height, size.height / 4, height, size.height / 2)
            ..quadraticBezierTo(height, size.height * 3 / 4, 0.0, size.height)
            ..lineTo(size.width, size.height)
            ..lineTo(size.width, 0.0)
            ..close();
        }
        break;
      default: //right
        if (direction == ArcDirection.Outside) {
          return Path()
            ..moveTo(size.width - height, 0.0)
            ..quadraticBezierTo(size.width, size.height / 4, size.width, size.height / 2)
            ..quadraticBezierTo(size.width, size.height * 3 / 4, size.width - height, size.height)
            ..lineTo(0.0, size.height)
            ..lineTo(0.0, 0.0)
            ..close();
        } else {
          return Path()
            ..moveTo(size.width, 0.0)
            ..quadraticBezierTo(size.width - height, size.height / 4, size.width - height, size.height / 2)
            ..quadraticBezierTo(size.width - height, size.height * 3 / 4, size.width, size.height)
            ..lineTo(0.0, size.height)
            ..lineTo(0.0, 0.0)
            ..close();
        }
        break;
    }
  }
}
