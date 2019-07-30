import 'package:flutter/material.dart';
import 'package:flutter_shape_of_view/shape_of_view.dart';

class TriangleShape extends Shape {
  final double percentBottom;
  final double percentLeft;
  final double percentRight;

  TriangleShape({
    this.percentBottom = 0.5,
    this.percentLeft = 0,
    this.percentRight = 0,
  });

  @override
  Path build({Rect rect, double scale}) {
    return generatePath(rect: rect);
  }

  Path generatePath({bool useBezier, Rect rect}) {
    final width = rect.width;
    final height = rect.height;
    return Path()
      ..moveTo(0, percentLeft * height)
      ..lineTo(percentBottom * width, height)
      ..lineTo(width, percentRight * height)
      ..close();
  }
}
