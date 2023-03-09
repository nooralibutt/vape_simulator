import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static final Prefs _instance = Prefs._internal();
  static Prefs get instance => _instance;
  factory Prefs() => _instance;
  Prefs._internal();

  static late SharedPreferences _prefs;

  static const _keyScore = "SCORE";

  Future<void> init() async => _prefs = await SharedPreferences.getInstance();

  void setScore(int score) => _prefs.setInt(_keyScore, score);
  int getScore() => _prefs.getInt(_keyScore) ?? 0;

  void incrementScore(int score) =>
      _prefs.setInt(_keyScore, getScore() + score);

  void decrementScore(int costReduction) {
    int score = getScore() - costReduction;
    if (score >= 0) {
      _prefs.setInt(_keyScore, score);
    }
  }
}
