import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalSpacing extends StatelessWidget {
  final double of;
  const VerticalSpacing({super.key, this.of = 40});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: of.h);
  }
}

class HorizontalSpacing extends StatelessWidget {
  final double of;
  const HorizontalSpacing({super.key, this.of = 40});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: of.w);
  }
}
