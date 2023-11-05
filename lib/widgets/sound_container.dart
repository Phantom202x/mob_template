import 'package:flutter/material.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:just_audio/just_audio.dart';

import '../models/style.dart';
import '../models/sound_model.dart';

class SoundContainer extends StatefulWidget {
  const SoundContainer({
    super.key,
    required this.index,
    // this.useImage = false,
  });
  final int index;

  @override
  State<SoundContainer> createState() => _SoundContainerState();
}

class _SoundContainerState extends State<SoundContainer> {
  // final bool useImage;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    init();
  }

  init() async {
    await player.seek(Duration.zero, index: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: 120,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
            color: kSecondaryLightColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              StreamBuilder<CombineStreams>(
                  stream: playerStream,
                  builder: (context, snapshot) {
                    final playerState =
                        snapshot.data?.secondStream as PlayerState?;
                    final playing = playerState?.playing;
                    final processingState = playerState?.processingState;
                    final sequence = snapshot.data?.sequence;
                    return InkWell(
                      onTap: () async {
                        if (sequence?.currentIndex != widget.index) {
                          await player.seek(Duration.zero, index: widget.index);
                          await player.play();
                        } else if (!(playing ?? false)) {
                          await player.play();
                        } else if (processingState !=
                            ProcessingState.completed) {
                          await player.pause();
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kBackgroundDarkColor,
                        ),
                        child: StreamBuilder(
                            stream: player.playerStateStream,
                            builder: (context, snapshot) {
                              final playing = snapshot.data?.playing;
                              final processingState =
                                  snapshot.data?.processingState;
                              if (sequence?.currentIndex != widget.index) {
                                return Icon(
                                  Icons.play_arrow_rounded,
                                  size: 40,
                                  color: kSecondaryLightColor,
                                );
                              } else if (!(playing ?? false)) {
                                return Icon(
                                  Icons.play_arrow_rounded,
                                  size: 40,
                                  color: kSecondaryLightColor,
                                );
                              } else if (processingState !=
                                  ProcessingState.completed) {
                                return Icon(
                                  Icons.pause_rounded,
                                  size: 40,
                                  color: kSecondaryLightColor,
                                );
                              }
                              return Icon(
                                Icons.play_arrow_rounded,
                                size: 40,
                                color: kSecondaryLightColor,
                              );
                            }),
                      ),
                    );
                  }),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: StreamBuilder<CombineStreams>(
                    stream: sliderStream,
                    builder: (context, snapshot) {
                      final positionData = snapshot.data?.secondStream;
                      final sequence = snapshot.data?.sequence;
                      late Duration progress, buffered, duration;
                      if (sequence?.currentIndex != widget.index) {
                        progress = buffered = Duration.zero;
                        duration = sequence?.effectiveSequence
                                .elementAt(widget.index)
                                .duration ??
                            Duration.zero;
                      } else {
                        progress = positionData?.position ?? Duration.zero;
                        buffered =
                            positionData?.bufferedPosition ?? Duration.zero;
                        duration = positionData?.duration ?? Duration.zero;
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            songs[widget.index].title,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: kBackgroundDarkColor,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ProgressBar(
                            barHeight: 6,
                            baseBarColor: Colors.grey[500],
                            bufferedBarColor: Colors.grey,
                            progressBarColor: kBackgroundDarkColor,
                            thumbColor: kBackgroundDarkColor,
                            progress: progress,
                            buffered: buffered,
                            total: duration,
                            onSeek: (value) async {
                              await player.seek(value, index: widget.index);
                              player.play();
                            },
                          ),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
