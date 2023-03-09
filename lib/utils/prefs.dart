import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static final Prefs _instance = Prefs._internal();
  static Prefs get instance => _instance;

  factory Prefs() {
    return _instance;
  }
  Prefs._internal();

  static late SharedPreferences _prefs;

  static const keyScore = "SCORE";
  static const keyAppLaunches = "APP_LAUNCHES";
  static const keyShowInApp = "SHOW_IN_APP";
  static const KEY_APP_LAUNCHES = "APP_LAUNCHES";

  Future<void> init() async => _prefs = await SharedPreferences.getInstance();

  static bool shouldIShowInAppReview() {
    final counter = _prefs.getInt(keyShowInApp) ?? 1;
    _prefs.setInt(keyShowInApp, counter + 1);

    return counter % 30 == 0;
  }

  void setScore(int score) => _prefs.setInt(keyScore, score);

  int getScore() => _prefs.getInt(keyScore) ?? 0;

  void incrementScore(int score) {
    _prefs.setInt(keyScore, getScore() + score);
  }

  void decrementScore(int costReduction) {
    int score = getScore() - costReduction;
    if (score >= 0) {
      _prefs.setInt(keyScore, score);
    }
  }

  incrementAppLaunches() => _prefs.setInt(KEY_APP_LAUNCHES, getAppLaunches());
  int getAppLaunches() => _prefs.getInt(KEY_APP_LAUNCHES) ?? 0;
}
