import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shape_of_view/shape_of_view.dart';

enum BubblePosition { Bottom, Top, Left, Right }

class BubbleShape extends Shape {
  final BubblePosition position;

  final double borderRadius;
  final double arrowHeight;
  final double arrowWidth;

  final double arrowPositionPercent;

  BubbleShape({
    this.position = BubblePosition.Bottom,
    this.borderRadius = 12,
    this.arrowHeight = 10,
    this.arrowWidth = 10,
    this.arrowPositionPercent = 0.5
  });

  @override
  Path build({Rect rect, double scale}) {
    return generatePath(rect: rect);
  }

  Path generatePath({Rect rect}) {
    final Path path = new Path();

    double topLeftDiameter = max(borderRadius , 0);
    double topRightDiameter = max(borderRadius , 0);
    double bottomLeftDiameter = max(borderRadius , 0);
    double bottomRightDiameter = max(borderRadius , 0);

    final double spacingLeft = this.position == BubblePosition.Left ? arrowHeight : 0;
    final double spacingTop = this.position == BubblePosition.Top ? arrowHeight : 0;
    final double spacingRight = this.position == BubblePosition.Right ? arrowHeight : 0;
    final double spacingBottom = this.position == BubblePosition.Bottom ? arrowHeight : 0;

    final double left = spacingLeft + rect.left;
    final double top = spacingTop + rect.top;
    final double right = rect.right - spacingRight;
    final double bottom = rect.bottom - spacingBottom;

    final double centerX = (rect.left + rect.right) * arrowPositionPercent;

    path.moveTo(left + topLeftDiameter / 2.0, top);
    //LEFT, TOP

    if (position == BubblePosition.Top) {
      path.lineTo(centerX - arrowWidth, top);
      path.lineTo(centerX, rect.top);
      path.lineTo(centerX + arrowWidth, top);
    }
    path.lineTo(right - topRightDiameter / 2.0, top);

    path.quadraticBezierTo(right, top, right, top + topRightDiameter / 2);
    //RIGHT, TOP

    if (position == BubblePosition.Right) {
      path.lineTo(right, bottom - (bottom * (1 - arrowPositionPercent)) - arrowWidth);
      path.lineTo(rect.right, bottom - (bottom * (1 - arrowPositionPercent)));
      path.lineTo(right, bottom - (bottom * (1 - arrowPositionPercent)) + arrowWidth);
    }
    path.lineTo(right, bottom - bottomRightDiameter / 2);

    path.quadraticBezierTo(right, bottom, right - bottomRightDiameter / 2, bottom);
    //RIGHT, BOTTOM

    if (position == BubblePosition.Bottom) {
      path.lineTo(centerX + arrowWidth, bottom);
      path.lineTo(centerX, rect.bottom);
      path.lineTo(centerX - arrowWidth, bottom);
    }
    path.lineTo(left + bottomLeftDiameter / 2, bottom);

    path.quadraticBezierTo(left, bottom, left, bottom - bottomLeftDiameter / 2);
    //LEFT, BOTTOM

    if (position == BubblePosition.Left) {
      path.lineTo(left, bottom - (bottom * (1 - arrowPositionPercent)) + arrowWidth);
      path.lineTo(rect.left, bottom - (bottom * (1 - arrowPositionPercent)));
      path.lineTo(left, bottom - (bottom * (1 - arrowPositionPercent)) - arrowWidth);
    }
    path.lineTo(left, top + topLeftDiameter / 2);

    path.quadraticBezierTo(left, top, left + topLeftDiameter / 2, top);

    path.close();

    return path;
  }
}
