import 'package:flame/components/component.dart';
import 'package:flutter/widgets.dart';

import 'Meteor.dart';

const ComponentSize = 30.0;
const SPEED = 200.0;

class Bullet extends SpriteComponent {
  Offset initialDirection;
  List<Meteor> meteorList;
  var bulletDestroy = false;

  Bullet(this.initialDirection, this.meteorList)
      : super.square(ComponentSize, 'bullet.png');

  @override
  void update(double t) {
    super.update(t);
    this.y -= t * SPEED;

    if (meteorList.isNotEmpty) {
      meteorList.forEach((meteor) {
        if (!meteor.remove) {
          bool remove = this.toRect().contains(meteor.toRect().bottomCenter) ||
              this.toRect().contains(meteor.toRect().bottomLeft) ||
              this.toRect().contains(meteor.toRect().bottomRight);
          if (remove) {
            meteor.remove = true;
            bulletDestroy = true;
          }
        }
      });
    }
  }

  @override
  bool destroy() {
    if (this.y < 0) {
      return true;
    }
    return bulletDestroy;
  }

  @override
  void resize(Size size) {
    this.x = this.initialDirection.dx + 15;
    this.y = size.height - 55;
  }
}
