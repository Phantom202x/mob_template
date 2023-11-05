import 'package:flutter/material.dart';
import 'package:quiz_template/models/style.dart';

class TextParagraph extends StatelessWidget {
  const TextParagraph(
      {super.key,
      required this.heading,
      required this.content,
      this.imageUrl,
      required this.textAlign});
  final String heading, content;
  final String? imageUrl;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Text(
              heading,
              style: kHeaddingStyleDark,
              textAlign: textAlign,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          if (imageUrl != null)
            Image.asset(
              imageUrl!,
              width: MediaQuery.sizeOf(context).width,
            ),
          if (imageUrl != null)
            const SizedBox(
              height: 10,
            ),
          Text(
            content,
            style: kNormalStyleDark,
            textAlign: textAlign,
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
