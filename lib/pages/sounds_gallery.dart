import 'package:flutter/material.dart';
import 'package:quiz_template/models/sound_model.dart';
import 'package:quiz_template/widgets/appbar.dart';
import 'package:quiz_template/widgets/sound_container.dart';

class SoundsGallery extends StatefulWidget {
  const SoundsGallery({super.key});

  @override
  State<SoundsGallery> createState() => _SoundsGalleryState();
}

class _SoundsGalleryState extends State<SoundsGallery> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await player.setAudioSource(audiosPlaylist);
  }

  @override
  Widget build(BuildContext context) {
    return TemplateAppBar(
      title: "Sounds Gallery",
      canPop: true,
      isCenter: true,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ...List.generate(
              songs.length,
              (index) => SoundContainer(index: index),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
