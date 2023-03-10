import 'package:flutter/material.dart';

class Item {
  final String flavour;
  final Color color;
  final int buy;

  Item(this.flavour, this.color, this.buy);

  static final allFlavour = [
    Item('Basic Juice', Colors.yellow, 0),
    Item('BlueBerry chill', Colors.blue, 2000),
    Item('Fruit Twist', Colors.red, 3000),
    Item('Sour Power', Colors.deepOrangeAccent, 2050),
    Item('Tentacle', Colors.purple, 2000),
    Item('Green Apple', Colors.green, 2000),
    Item('Arctic chill', Colors.cyan, 2000),
    Item('Razzle Dazzle', Colors.teal, 2000),
    Item('VG Lychee', Colors.pink, 4000),
    Item('VG Tangerine', Colors.orange, 4000),
    Item('VG Ice Berry', Colors.lime, 4000),
    Item('VG Cookie Dough', Colors.deepOrangeAccent, 4000),
  ];
}
