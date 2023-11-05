import 'package:flutter/material.dart';
import 'package:quiz_template/models/data.dart';
import 'package:quiz_template/models/style.dart';
import 'package:quiz_template/widgets/appbar.dart';
import 'package:quiz_template/widgets/text_paragraph.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateAppBar(
      title: "My Text Page",
      canPop: true,
      isCenter: true,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Page Head",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: kBackgroundDarkColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ...List.generate(
              texts.length,
              (index) => TextParagraph(
                heading: texts[index].heading,
                content: texts[index].content,
                imageUrl: texts[index].imageUrl,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
