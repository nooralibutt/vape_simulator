import 'package:flutter/material.dart';

class BgImage extends StatelessWidget {
  final Widget child;
  final String imagePath;

  const BgImage(
      {Key? key, required this.child, this.imagePath = 'assets/images/bg.png'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(bottom: false, child: child),
    );
  }
}
