# flutter_shape_of_view

Give a custom shape to any flutter widget, Material Design 2 ready

# Download

https://pub.dev/packages/kenburns

```
dependencies:
  shape_of_view: 
```

Give a custom shape to any android view
Useful for Material Design 2

[![screen](https://raw.githubusercontent.com/florent37/ShapeOfView/master/medias/shrine.gif)](https://www.github.com/florent37/ShapeOfView)
[![screen](https://raw.githubusercontent.com/florent37/ShapeOfView/master/medias/sample_diagonal.gif)](https://www.github.com/florent37/ShapeOfView)
[![screen](https://raw.githubusercontent.com/florent37/ShapeOfView/master/medias/sample_arc.gif)](https://www.github.com/florent37/ShapeOfView)

```dart
ShapeOfView(
  shape: YOUR_SHAPE,
  elevation: 4,
  height: 300, //height & width are optional
  child: ...
),
```

# Use implemented shapes

ShapeOfView came with pre-created shapes :

## Circle

[![screen](https://raw.githubusercontent.com/florent37/ShapeOfView/master/medias/circle.png)](https://www.github.com/florent37/ShapeOfView)

```dart
ShapeOfView(
  shape: CircleShape(
    borderColor: Colors.white, //optional
    borderWidth: 2, //optional
  ),
  child: ...
```

## RoundRect

[![screen](https://raw.githubusercontent.com/florent37/ShapeOfView/master/medias/roundrect.png)](https://www.github.com/florent37/ShapeOfView)

```dart
ShapeOfView(
  shape: RoundRectShape(
     borderRadius: BorderRadius.circular(12),
     borderColor: Colors.white, //optional
     borderWidth: 2, //optional
  ),
  child: ...
```

## ClipCorner

[![screen](https://raw.githubusercontent.com/florent37/ShapeOfView/master/medias/cut_corner.png)](https://www.github.com/florent37/ShapeOfView)

```dart
ShapeOfView(
  shape: CutCornerShape(
     borderRadius: BorderRadius.circular(12);
  ),
  child: ...
```

## Arc

[![screen](https://raw.githubusercontent.com/florent37/ShapeOfView/master/medias/arc.png)](https://www.github.com/florent37/ShapeOfView)

```dart
ShapeOfView(
  shape: ArcShape(
    direction: ArcDirection.Outside,
    height: 20,
    position: ArcPosition.Bottom
  ),
  child: ...
)
```

## Diagonal

[![screen](https://raw.githubusercontent.com/florent37/ShapeOfView/master/medias/diagonal.png)](https://www.github.com/florent37/ShapeOfView)


```dart
ShapeOfView(
  elevation: 4,
  height: 300,
  shape: DiagonalShape(
    position: DiagonalPosition.Bottom,
    direction: DiagonalDirection.Right,
    angle: DiagonalAngle.deg(angle: 10)
  ),
  child: ...
)
```

## Triangle

[![screen](https://raw.githubusercontent.com/florent37/ShapeOfView/master/medias/triangle.png)](https://www.github.com/florent37/ShapeOfView)

```dart
ShapeOfView(
  shape: TriangleShape(
    percentBottom: 0.5,
    percentLeft: 0,
    percentRight: 0
  ),
  child: ...,
)
```

## Bubble

[![screen](https://raw.githubusercontent.com/florent37/ShapeOfView/master/medias/bubble.png)](https://www.github.com/florent37/ShapeOfView)

```dart
ShapeOfView(
  shape: BubbleShape(
    position: BubblePosition.Bottom,
    arrowPositionPercent: 0.5,
    borderRadius: 20,
    arrowHeight: 10,
    arrowWidth: 10
  ),
  child: ...,
)
```

## Star

[![screen](https://raw.githubusercontent.com/florent37/ShapeOfView/master/medias/star_5_pointed.png)](https://www.github.com/florent37/ShapeOfView)
[![screen](https://raw.githubusercontent.com/florent37/ShapeOfView/master/medias/star_11_pointed.png)](https://www.github.com/florent37/ShapeOfView)

```dart
ShapeOfView(
  shape: StarShape(
    noOfPoints: 5
  ),
  child: ...,
)
```

## Polygon

[![screen](https://raw.githubusercontent.com/florent37/ShapeOfView/master/medias/polygon.png)](https://www.github.com/florent37/ShapeOfView)

```dart
ShapeOfView(
  shape: PolygonShape(
    numberOfSides: 9
  ),
  child: ...,
)
```

# Use a custom Shape

```dart
ShapeOfView(
  shape: CustomShape(
    builder: (rect) => Path()
        ..moveTo(0, 0)
        ..close()
  ),
  child: ...,
)
```

or extend Shape

```dart
class MyShape extends Shape {

  @override
  Path build({Rect rect, double scale}) {
    return Path()
       ..moveTo(0, 0)
       ..close();
  }

}
```

then 

```dart
ShapeOfView(
  shape: MyShape(),
  child: ...,
)
```

## Getting Started with Flutter

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

# License

    Copyright 2019 florent37, Inc.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.