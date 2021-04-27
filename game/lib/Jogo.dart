import 'package:flame/flame.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';

import 'package:jogo/components/Meteor.dart';
import 'package:jogo/components/Spaceship.dart';
import 'package:jogo/components/Bullet.dart';

var score = 0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var game = MyGame();
  Flame.images.loadAll(['rocket.png', 'meteor.png', 'bullet.png']);

  runApp(game.widget);
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(
      title: Text("Pontos"),
    ),
    body: Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage("background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: GameWrapper(game),
    ),
  )));
}

class GameWrapper extends StatelessWidget {
  final MyGame game;
  GameWrapper(this.game);
  @override
  Widget build(BuildContext context) {
    return game.widget;
  }
}

class MyGame extends BaseGame with TapDetector {
  var spaceship = new Spaceship();
  var creationMeteorTimer = 0.0;
  List<Meteor> meteorList;

  MyGame() {
    meteorList = <Meteor>[];
    add(spaceship);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void update(double t) {
    creationMeteorTimer += t;
    if (creationMeteorTimer >= 1.9) {
      creationMeteorTimer = 0.0;
      var meteor = new Meteor();
      meteorList.add(meteor);
      add(meteor);
    }
    super.update(t);
  }

  @override
  void onTapDown(TapDownDetails details) {
    print(
        "taped down on ${details.globalPosition.dx} - ${details.globalPosition.dy}");
    spaceship.direction = details.globalPosition.dx;
    addBullet(details.globalPosition);
  }

  @override
  void onTapUp(TapUpDetails details) {
    print(
        "taped up ${details.globalPosition.dx} - ${details.globalPosition.dy}");
  }

  void addBullet(Offset position) {
    Bullet bullet = new Bullet(position, meteorList);
    add(bullet);
  }
}
