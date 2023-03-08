import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vape_simulator/utils/size_config.dart';
import 'package:vape_simulator/widgets/base_scaffold.dart';

class GameScreen extends StatelessWidget {
  static const String routeName = "/GameScreen";
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgImage(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.asset('assets/images/dollar.png', height: 50),
                  const HorizontalSpacing(),
                  Text(
                    '230',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 50,
              left: 20,
              child: Image.asset('assets/images/settings.png', height: 50),
            ),
            Positioned(
              bottom: 50,
              right: 20,
              child: Image.asset('assets/images/cart.png', height: 50),
            ),
            Positioned(
              left: 0.35.sw,
              right: 0.35.sw,
              bottom: 200.h,
              child: Image.asset('assets/images/vapes/2.png'),
            ),
            Positioned(
              bottom: 700.h,
              left: 0.35.sw,
              right: 0.35.sw,
              child: Image.asset('assets/images/power_btn.png', height: 50),
            ),
          ],
        ),
      ),
    );
  }
}
