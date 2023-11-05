import 'package:flutter/material.dart';
import 'package:quiz_template/models/data.dart';
import 'package:quiz_template/models/style.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    required this.image,
  });
  final MyImage image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 80,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kSecondaryDarkColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image.url),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                image.title,
                style: kNormalStyle,
                textAlign: TextAlign.left,
              ),
              Text(
                image.subTitle,
                style: kSubStyle,
                textAlign: TextAlign.left,
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            splashRadius: 30,
            onPressed: () {},
            icon: Icon(
              Icons.download_rounded,
              size: 28,
              color: kSecondaryLightColor,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
