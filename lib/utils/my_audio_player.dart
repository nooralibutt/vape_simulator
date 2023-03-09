import 'package:audioplayers/audioplayers.dart';

class MyAudioPlayer {
  static final MyAudioPlayer _instance = MyAudioPlayer._();
  static MyAudioPlayer get instance => _instance;
  MyAudioPlayer._();

  final AudioPlayer _soundPlayer = AudioPlayer();
  final AudioPlayer _backgroundPlayer = AudioPlayer();
  final AudioPlayer _vapePlayer = AudioPlayer();

  void setAllSound() async {
    await _vapePlayer.setSource(AssetSource('audio/vape_sound.wav'));
    await _soundPlayer.setSource(AssetSource('audio/click_sound.wav'));
    await _backgroundPlayer
        .setSource(AssetSource('audio/background_sound.mp3'));
  }

  void stopBackgroundSound() {
    _backgroundPlayer.stop();
  }

  void stopVapeSound() {
    _vapePlayer.stop();
  }

  void stopClickedSound() {
    _soundPlayer.stop();
  }

  void playButtonTapSound() async {
    await _soundPlayer.resume();
  }

  void playVapeSound() async {
    await _vapePlayer.resume();
  }

  void playBackgroundSound() async {
    await _backgroundPlayer.resume();
    await _backgroundPlayer.setReleaseMode(ReleaseMode.loop);
  }
}
