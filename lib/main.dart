import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vape_simulator/screens/selection_screens/choose_flavour_screen.dart';
import 'package:vape_simulator/utils/app_theme.dart';
import 'package:vape_simulator/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1242, 2688),
      builder: (BuildContext context, Widget? child) => MaterialApp(
        title: 'Vape Simulator',
        theme: AppTheme.buildTheme(),
        home: const ChooseFlavourScreen(),
        routes: routes,
      ),
    );
  }
}
