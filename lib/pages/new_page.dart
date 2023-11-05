import 'package:flutter/material.dart';
import 'package:quiz_template/widgets/appbar.dart';
import 'package:quiz_template/widgets/image_container.dart';

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TemplateAppBar(
        title: "New page",
        canPop: true,
        useAbout: true,
        isCenter: true,
        child: Column(
          children: [
            ImageContainer(
              borderRadius: 50,
              title: "title",
              useShadow: true,
            ),
          ],
        ),
      ),
    );
  }
}
