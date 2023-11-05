import 'package:flutter/material.dart';
import 'package:quiz_template/models/data.dart';

import '../widgets/appbar.dart';
import '../widgets/image_gallery.dart';

class MyGallery extends StatelessWidget {
  const MyGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateAppBar(
      title: "Test",
      isCenter: true,
      canPop: true,
      child: GridImages(
        imagesUrl: images,
      ),
    );
  }
}
