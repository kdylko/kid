import 'package:flutter/material.dart';
import 'package:spritewidget/spritewidget.dart';

class Game extends StatefulWidget {
  @override
  MyWidgetState createState() => new MyWidgetState();
}

class MyWidgetState extends State<Game> {
  NodeWithSize rootNode;

  @override
  void initState() {
    super.initState();
    rootNode = new NodeWithSize(const Size(1024.0, 1024.0));
  }

  @override
  Widget build(BuildContext context) {
    return new SpriteWidget(
      rootNode
      );
  }

}
