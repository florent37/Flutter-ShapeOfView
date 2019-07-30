import 'package:flutter/material.dart';

export 'package:shape_of_view/shape/arc.dart';
export 'package:shape_of_view/shape/circle.dart';
export 'package:shape_of_view/shape/cutcorner.dart';
export 'package:shape_of_view/shape/diagonal.dart';
export 'package:shape_of_view/shape/polygon.dart';
export 'package:shape_of_view/shape/roundrect.dart';
export 'package:shape_of_view/shape/star.dart';
export 'package:shape_of_view/shape/triangle.dart';
export 'package:shape_of_view/shape/bubble.dart';
export 'package:shape_of_view/shape/custom.dart';

abstract class Shape {
  Path build({Rect rect, double scale});
}

class ShapeOfViewBorder extends ShapeBorder {
  final Shape shape;

  ShapeOfViewBorder({this.shape}) : assert(shape != null);

  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsets.all(0);
  }

  @override
  ShapeBorder scale(double t) => this;

  /*
  @override
  ShapeBorder lerpFrom(ShapeBorder a, double t) {
    if (a is CircleBorder)
      return CircleBorder(side: BorderSide.lerp(a.side, side, t));
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder lerpTo(ShapeBorder b, double t) {
    if (b is CircleBorder)
      return CircleBorder(side: BorderSide.lerp(side, b.side, t));
    return super.lerpTo(b, t);
  }
  */

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return null;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return shape.build(rect: rect, scale: 1);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  @override
  bool operator ==(dynamic other) {
    if (runtimeType != other.runtimeType) return false;
    final ShapeOfViewBorder typedOther = other;
    return shape == typedOther.shape;
  }

  @override
  int get hashCode => shape.hashCode;

  @override
  String toString() {
    return '$runtimeType($shape)';
  }
}

class ShapeOfView extends StatelessWidget {
  final Widget child;
  final Shape shape;
  final double elevation;
  final Clip clipBehavior;
  final double height;
  final double width;

  ShapeOfView(
      {this.child,
      this.elevation = 4,
      this.shape,
      this.clipBehavior = Clip.antiAlias,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: ShapeOfViewBorder(shape: this.shape),
      clipBehavior: this.clipBehavior,
      elevation: this.elevation,
      child: Container(
        height: this.height,
        width: this.width,
        child: this.child,
      ),
    );
  }
}
