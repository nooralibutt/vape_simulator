import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vape_simulator/models/items.dart';
import 'package:vape_simulator/utils/my_audio_player.dart';
import 'package:vape_simulator/utils/prefs.dart';

class PurchaseItemProvider extends ChangeNotifier {
  Item? _item;
  bool isPressed = false;
  double flavour = 140;
  int percent = 0;
  int score = 0;
  bool smoke = false;
  int saveScore = Prefs.instance.getScore();
  int _count = 0;

  set item(Item? value) {
    _item = value;
    notifyListeners();
  }

  Item get getItem => _item ?? Item('green', Colors.red, 2000);

  void onPress() async {
    isPressed = true;
    // MyAudioPlayer.instance.playVapeSound();
    do {
      if (flavour > 0) {
        score += 1;
        flavour -= 1;
      } else {
        flavour = 0;
      }
      if (percent == 100) {
      } else {
        percent = percent + 10;
      }
      notifyListeners();
      await Future.delayed(const Duration(milliseconds: 120));
    } while (isPressed);

    Prefs.instance.incrementScore(score);
    saveScore = Prefs.instance.getScore();
    notifyListeners();
  }

  void onEnd() {
    smoke = true;
    Timer.periodic(const Duration(milliseconds: 120), (Timer t) {
      {
        if (percent == 0) {
          MyAudioPlayer.instance.stopVapeSound();
          isPressed = false;
          smoke = false;
          showAd();
          // AdManager.instance.showCountedInterstitial();
          t.cancel();
        } else {
          MyAudioPlayer.instance.stopVapeSound();
          percent = percent - 10;
          isPressed = false;
        }
        notifyListeners();
      }
    });
  }

  bool flavourFinish() {
    if (flavour == 0) {
      return true;
    } else {
      return false;
    }
  }

  void freeRefill(BuildContext context) {
    flavour = 140;
    // AdManager.instance.showCountedInterstitial();
    Navigator.pop(context);
    notifyListeners();
  }

  void decrementPrice(int costReduction) {
    Prefs.instance.decrementScore(costReduction);
    saveScore = Prefs.instance.getScore();
    flavour = 140;
    notifyListeners();
  }

  void earnMoney(BuildContext context) {
    // AdManager.instance.showCountedInterstitial();
    Prefs.instance.incrementScore(score + 200);
    saveScore = Prefs.instance.getScore();
    notifyListeners();
  }

  void showAd() {
    if (_count == 0) {
      // AdManager.instance.showCountedInterstitial();
      _count = 1;
    }
  }
}
