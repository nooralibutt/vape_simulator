import 'dart:io';

import 'package:easy_ads_flutter/easy_ads_flutter.dart';

class AdIdManager extends IAdIdManager {
  const AdIdManager();

  @override
  AppAdIds? get admobAdIds => null;

  //SuperHero Wallpapers App Unity Ad Ids
  @override
  AppAdIds? get unityAdIds => AppAdIds(
        appId: Platform.isAndroid ? '5168082' : '5168083',
        bannerId: Platform.isAndroid ? 'Banner_Android' : 'Banner_iOS',
        interstitialId:
            Platform.isAndroid ? 'Interstitial_Android' : 'Interstitial_iOS',
        rewardedId: Platform.isAndroid ? 'Rewarded_Android' : 'Rewarded_iOS',
      );

  @override
  AppAdIds? get appLovinAdIds => null;

  @override
  AppAdIds? get fbAdIds => null;
}
