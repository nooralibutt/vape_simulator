import 'package:easy_service_manager/easy_service_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vape_simulator/screens/selection_screens/choose_bg_screen.dart';
import 'package:vape_simulator/utils/ad_id_manager.dart';
import 'package:vape_simulator/utils/strings.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "/SplashScreen";

  const SplashScreen({Key? key}) : super(key: key);

  Future<void> _initializePlugins() async {
    await EasyServicesManager.instance.initialize(
      // appIconPath: 'assets/diamond_images/icon.png',
      adKeywords: Strings.adKeywords,
      adIdManager: kDebugMode ? const TestAdIdManager() : const AdIdManager(),
      aboutAppDescription: Strings.aboutAppDescription,
      supportEmail: Strings.supportEmail,
      androidDeveloperName: Strings.android_developer_name,
      useNotifications: true,
      notificationsList: Strings.notificationsList,
      // privacyPolicy: Strings.privacyPolicyUrl,
      remoteConfigEndpointUrl: Strings.remoteConfigEndpointUrl,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WelcomeWidget(
      initializeBuilder: _initializePlugins,
      nextScreenRouteName: ChooseBgScreen.routeName,
      // iconPath: 'assets/diamond_images/icon.png',
    );
  }
}
