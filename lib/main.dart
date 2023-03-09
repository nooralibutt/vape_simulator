import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vape_simulator/provider/purchase_item_provider.dart';
import 'package:vape_simulator/screens/game/game_screen.dart';
import 'package:vape_simulator/utils/app_theme.dart';
import 'package:vape_simulator/utils/prefs.dart';
import 'package:vape_simulator/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1242, 2688),
      builder: (BuildContext context, Widget? child) => ListenableProvider(
        create: (BuildContext context) => PurchaseItemProvider(),
        child: MaterialApp(
          title: 'Vape Simulator',
          theme: AppTheme.buildTheme(),
          home: const GameScreen(),
          routes: routes,
        ),
      ),
    );
  }
}
