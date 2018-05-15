
import 'dart:async';
import 'dart:ui' as ui show Image;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spritewidget/spritewidget.dart';

ImageMap _images;
SpriteSheet _sprites;
enum WeatherType {
  sun,
  rain,
  snow
}

 WeatherWorld weatherWorld;
class Game extends StatefulWidget {
  @override
  MyWidgetState createState() => new MyWidgetState();
}

class MyWidgetState extends State<Game> {
  NodeWithSize rootNode;

  @override
  void initState() {
    super.initState();
    weatherWorld = new WeatherWorld();

  }

  @override
  Widget build(BuildContext context) {
    return new SpriteWidget(
      weatherWorld
      );
  }

}

// For the different weathers we are displaying different gradient backgrounds,
// these are the colors for top and bottom.
const List<Color> _kBackgroundColorsTop = const <Color>[
  const Color(0xff5ebbd5),
  const Color(0xff0b2734),
  const Color(0xffcbced7)
];

const List<Color> _kBackgroundColorsBottom = const <Color>[
  const Color(0xff4aaafb),
  const Color(0xff4c5471),
  const Color(0xffe0e3ec)
];

// The GradientNode performs custom drawing to draw a gradient background.
class GradientNode extends NodeWithSize {
  GradientNode(Size size, this.colorTop, this.colorBottom) : super(size);

  Color colorTop;
  Color colorBottom;

  @override
  void paint(Canvas canvas) {
    applyTransformForPivot(canvas);

    Rect rect = Offset.zero & size;
    Paint gradientPaint = new Paint()..shader = new LinearGradient(
      begin: FractionalOffset.topLeft,
      end: FractionalOffset.bottomLeft,
      colors: <Color>[colorTop, colorBottom],
      stops: <double>[0.0, 1.0]
    ).createShader(rect);

    canvas.drawRect(rect, gradientPaint);
  }
}

class WeatherWorld extends NodeWithSize {
  WeatherWorld() : super(const Size(2048.0, 2048.0)) {

    // Start by adding a background.
    _background = new GradientNode(
      this.size,
      _kBackgroundColorsTop[0],
      _kBackgroundColorsBottom[0],
    );
    addChild(_background);




    // Add the sun, rain, and snow (which we are going to fade in/out depending
    // on which weather are selected.

  }

}
 GradientNode _background;