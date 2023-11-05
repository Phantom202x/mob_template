import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

// audio player
AudioPlayer player = AudioPlayer();

// set asset for single media player
setAudio({required String soundUrl}) async {
  await player.setAsset(soundUrl);
}

// initialize audios playlist
final audiosPlaylist = ConcatenatingAudioSource(children: [
  AudioSource.uri(
    Uri.parse("asset:///assets/sounds/conclusion.mp3"),
  ),
  AudioSource.uri(
    Uri.parse("asset:///assets/sounds/introduction.mp3"),
  ),
  AudioSource.uri(
    Uri.parse("asset:///assets/sounds/recording.mp3"),
  ),
]);

// initializing audios list
List<Song> songs = [
  Song(
    title: "Conclusion",
    artist: "ana",
    soundUrl: "assets/sounds/conclusion.mp3",
  ),
  Song(
    title: "Introduction",
    artist: "ana",
    soundUrl: "assets/sounds/introduction.mp3",
  ),
  Song(
    title: "Recording",
    artist: "ana",
    soundUrl: "assets/sounds/recording.mp3",
  ),
];

// audio info class
class Song {
  late int id;
  static int counter = 0;
  final String title, artist, soundUrl, imageUrl;

  Song({
    this.title = "",
    this.artist = "Unknown",
    required this.soundUrl,
    this.imageUrl = "assets/images/Song.png",
  }) {
    id = counter++;
  }
}

// combine 2 streams
class CombineStreams {
  final SequenceState? sequence;
  final dynamic secondStream;

  CombineStreams({this.sequence, required this.secondStream});
}

// combine 3 streams for progress bar
class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  PositionData(
      {required this.position,
      required this.bufferedPosition,
      required this.duration});
}

// get player stream for play/pause button
Stream<CombineStreams> get playerStream => Rx.combineLatest2(
      player.sequenceStateStream,
      player.playerStateStream,
      (sequenceState, playerState) =>
          CombineStreams(sequence: sequenceState, secondStream: playerState),
    );

// get player stream for progress bar button
Stream<CombineStreams> get sliderStream => Rx.combineLatest2(
      player.sequenceStateStream,
      positionDataStream,
      (sequenceState, positionData) =>
          CombineStreams(sequence: sequenceState, secondStream: positionData),
    );

// get progress bar stream for updating it's position
Stream<PositionData> get positionDataStream =>
    Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
      player.positionStream,
      player.bufferedPositionStream,
      player.durationStream,
      (position, buffered, duration) => PositionData(
        position: position,
        bufferedPosition: buffered,
        duration: duration ?? Duration.zero,
      ),
    );


// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:quiz_template/models/style.dart';

// class Song {
//   int id;
//   String title, imageUrl;

//   Song({
//     required this.id,
//     this.title = "",
//     this.imageUrl = "assets/images/Song.png",
//   });
// }

// class MySongPlayer {
//   final player = AudioPlayer();

//   setAudioUrl({required String url}) async {
//     await player.setAsset(url);
//   }

//   playAudio() async {
//     if (player.playing == false) {
//       await player.play();
//     }
//   }

//   pauseAudio() async {
//     if (player.playing == true) {
//       await player.pause();
//     }
//   }

//   currentIcon() {
//     if (player.playing) {
//       return Icon(
//         Icons.pause_rounded,
//         size: 24,
//         color: kSecondaryLightColor,
//       );
//     }
//     return Icon(
//       Icons.play_arrow_rounded,
//       size: 24,
//       color: kSecondaryLightColor,
//     );
//   }
// }

// class PositionData {
//   final Duration position;
//   final Duration duration;

//   PositionData({required this.duration, required this.position});
// }
