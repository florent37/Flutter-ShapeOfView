import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shape_of_view/shape_of_view.dart';

class CircleShape extends Shape {
  CircleShape();

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
}
