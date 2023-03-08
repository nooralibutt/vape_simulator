import 'package:flutter/material.dart';
import 'package:vape_simulator/screens/selection_screens/choose_bg_screen.dart';
import 'package:vape_simulator/screens/selection_screens/choose_flavour_screen.dart';
import 'package:vape_simulator/screens/selection_screens/choose_vape_screen.dart';

final Map<String, WidgetBuilder> routes = {
  ChooseBgScreen.routeName: (context) => const ChooseBgScreen(),
  ChooseVapeScreen.routeName: (context) => const ChooseVapeScreen(),
  ChooseFlavourScreen.routeName: (context) => const ChooseFlavourScreen(),
};
