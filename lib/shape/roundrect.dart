import 'dart:math';
import 'package:vector_math/vector_math.dart';

import 'package:flutter/material.dart';
import 'package:flutter_shape_of_view/shape_of_view.dart';

class RoundRectShape extends Shape {
  final BorderRadius borderRadius;

  RoundRectShape({this.borderRadius});

  @override
  Path build({Rect rect, double scale}) {
    return generatePath(useBezier: false, rect: rect);
  }

  Path generatePath({bool useBezier, Rect rect}) {
    final Path path = Path();

    final double left = rect.left;
    final double top = rect.top;
    final double bottom = rect.bottom;
    final double right = rect.right;

    final double maxSize = min(rect.width / 2.0, rect.height / 2.0);

    double topLeftRadius = borderRadius.topLeft.x.abs();
    double topRightRadius =  borderRadius.topRight.x.abs();
    double bottomLeftRadius =  borderRadius.bottomLeft.x.abs();
    double bottomRightRadius =  borderRadius.bottomRight.x.abs();

    if (topLeftRadius > maxSize) {
      topLeftRadius = maxSize;
    }
    if (topRightRadius > maxSize) {
      topRightRadius = maxSize;
    }
    if (bottomLeftRadius > maxSize) {
      bottomLeftRadius = maxSize;
    }
    if (bottomRightRadius > maxSize) {
      bottomRightRadius = maxSize;
    }

    path.moveTo(left + topLeftRadius, top);
    path.lineTo(right - topRightRadius, top);

    //float left, float top, float right, float bottom, float startAngle, float sweepAngle, boolean forceMoveTo
    if (useBezier) {
      path.quadraticBezierTo(right, top, right, top + topRightRadius);
    } else {
      final double arc = topRightRadius > 0 ? 90 : -270;
      path.arcTo(Rect.fromLTRB(right - topRightRadius * 2.0, top, right, top + topRightRadius * 2.0), radians(-90), radians(arc), false);
    }
    path.lineTo(right, bottom - bottomRightRadius);
    if (useBezier) {
      path.quadraticBezierTo(right, bottom, right - bottomRightRadius, bottom);
    } else {
      final double arc = bottomRightRadius > 0 ? 90 : -270;
      path.arcTo(Rect.fromLTRB(right - bottomRightRadius * 2.0, bottom - bottomRightRadius * 2.0, right, bottom), 0, radians(arc), false);
    }
    path.lineTo(left + bottomLeftRadius, bottom);
    if (useBezier) {
      path.quadraticBezierTo(left, bottom, left, bottom - bottomLeftRadius);
    } else {
      final double arc = bottomLeftRadius > 0 ? 90 : -270;
      path.arcTo(Rect.fromLTRB(left, bottom - bottomLeftRadius * 2.0, left + bottomLeftRadius * 2.0, bottom), radians(90), radians(arc), false);
    }
    path.lineTo(left, top + topLeftRadius);
    if (useBezier) {
      path.quadraticBezierTo(left, top, left + topLeftRadius, top);
    } else {
      final double arc = topLeftRadius > 0 ? 90 : -270;
      path.arcTo(Rect.fromLTRB(left, top, left + topLeftRadius * 2.0, top + topLeftRadius * 2.0), radians(180), radians(arc), false);
    }
    path.close();

    return path;
  }

}