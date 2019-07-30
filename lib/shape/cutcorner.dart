import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shape_of_view/shape_of_view.dart';

class CutCornerShape extends Shape {
  final BorderRadius borderRadius;

  CutCornerShape({this.borderRadius});

  @override
  Path build({Rect rect, double scale}) {
    return generatePath(rect: rect);
  }

  Path generatePath({Rect rect}) {
    final topLeftDiameter = max(borderRadius.topLeft.x, 0);
    final topRightDiameter = max(borderRadius.topRight.x, 0);
    final bottomLeftDiameter = max(borderRadius.bottomLeft.x, 0);
    final bottomRightDiameter = max(borderRadius.bottomRight.x, 0);

    return Path()
      ..moveTo(rect.left + topLeftDiameter, rect.top)
      ..lineTo(rect.right - topRightDiameter, rect.top)
      ..lineTo(rect.right, rect.top + topRightDiameter)
      ..lineTo(rect.right, rect.bottom - bottomRightDiameter)
      ..lineTo(rect.right - bottomRightDiameter, rect.bottom)
      ..lineTo(rect.left + bottomLeftDiameter, rect.bottom)
      ..lineTo(rect.left, rect.bottom - bottomLeftDiameter)
      ..lineTo(rect.left, rect.top + topLeftDiameter)
      ..lineTo(rect.left + topLeftDiameter, rect.top)
      ..close();
  }
}
