import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shape_of_view/shape_of_view.dart';

class CircleShape extends Shape with BorderShape {
  final double borderWidth;
  final Color borderColor;

  final Paint borderPaint = Paint();

  CircleShape({
    this.borderWidth = 0,
    this.borderColor = Colors.white,
  }) {
    this.borderPaint.isAntiAlias = true;
    this.borderPaint.style = PaintingStyle.stroke;
  }

  @override
  Path build({Rect rect, double scale}) {
    return generatePath(rect: rect);
  }

  Path generatePath({bool useBezier, Rect rect}) {
    return Path()
      ..addOval(Rect.fromCircle(
        center: Offset(rect.width / 2.0, rect.height / 2.0),
        radius: min(rect.width / 2.0, rect.height / 2.0),
      ));
  }

  @override
  void drawBorder(Canvas canvas, Rect rect) {
    if(this.borderWidth > 0){
      borderPaint.color = this.borderColor;
      borderPaint.strokeWidth = this.borderWidth;
      canvas.drawCircle(rect.center, min((rect.width - borderWidth) /2.0, (rect.height - borderWidth) /2.0), borderPaint);
    }
  }


}
