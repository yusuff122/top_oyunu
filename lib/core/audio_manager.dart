import 'package:audioplayers/audioplayers.dart';


class AudioManager {
  final player = AudioPlayer();

  void playJump() {
    player.play(AssetSource('assets/sounds/jump.mp3'));
  }

  void playHit() {
    player.play(AssetSource('asstes/sounds/hit.mp3'));
  }
}
