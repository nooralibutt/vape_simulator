import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Smoke extends StatefulWidget {
  final Size size;
  const Smoke({Key? key, required this.size}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SmokeState();
  }
}

class _SmokeState extends State<Smoke> with TickerProviderStateMixin {
  late AnimationController animationController;
  final particleSystem = <Particle>[];
  @override
  void initState() {
    super.initState();

    //Generate particles
    List.generate(100, (i) {
      particleSystem.add(Particle(widget.size));
    });

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addListener(() {
            for (int i = 0; i < particleSystem.length; i++) {
              // Move particle
              particleSystem[i].move();

              // Restored particle
              if (particleSystem[i].remainingLife < 0 ||
                  particleSystem[i].radius < 0) {
                particleSystem[i] = Particle(widget.size);
              }
            }
          })
          ..repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // color: Colors.black,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) => CustomPaint(
          size: widget.size,
          painter: _DemoPainter(widget.size, particleSystem),
        ),
      ),
    );
  }
}

class _DemoPainter extends CustomPainter {
  final List<Particle> particleSystem;
  final Size screenSize;

  _DemoPainter(this.screenSize, this.particleSystem);

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particleSystem) {
      particle.display(canvas);
    }
  }

  @override
  bool shouldRepaint(_DemoPainter oldDelegate) => true;
}

class Particle {
  late Offset speed;
  late Offset location;
  late double radius;
  late double life;
  late Color color;
  late double opacity;

  late double remainingLife;
  late Size screenSize;
  var palette = <Color>[];

  Particle(Size screenSize) {
    Random rd = Random();

    this.screenSize = screenSize;
    speed = Offset(-5 + rd.nextDouble() * 12, 15.0 + rd.nextDouble() * 12);
    location = Offset(this.screenSize.width / 2, 180);
    radius = 50 + rd.nextDouble() * 40;
    life = 50 + rd.nextDouble() * 20;
    remainingLife = life;

    for (int i = 90; i < 100; i++) {
      palette.add(Colors.white);
    }

    color = palette[0];
  }

  move() {
    remainingLife--;
    radius--;
    location = location + speed;
    int colorI =
        palette.length - (remainingLife / life * palette.length).round();
    if (colorI >= 0 && colorI < palette.length) {
      color = palette[colorI];
    }
  }

  display(Canvas canvas) {
    opacity = (remainingLife / life * 100).round() / 100;
    var gradient = RadialGradient(
      colors: [
        Color.fromRGBO(color.red, color.green, color.blue, opacity),
        Color.fromRGBO(color.red, color.green, color.blue, opacity),
        Color.fromRGBO(color.red, color.green, color.blue, 0.0)
      ],
      stops: const [0.0, 0.5, 1.0],
    );

    Paint painter = Paint()
      ..style = PaintingStyle.fill
      ..shader = gradient
          .createShader(Rect.fromCircle(center: location, radius: radius));

    canvas.drawCircle(location, radius, painter);
  }
}
