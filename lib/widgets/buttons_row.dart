import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_template/models/style.dart';

class SocialButtonsRow extends StatelessWidget {
  const SocialButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.sizeOf(context).width - 40,
      decoration: BoxDecoration(
        color: kSecondaryLightColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {},
            padding: const EdgeInsets.all(0),
            splashRadius: 25,
            color: kBackgroundDarkColor,
            icon: SvgPicture.asset(
              "assets/icons/facebook.svg",
              alignment: Alignment.center,
              width: MediaQuery.sizeOf(context).width / 4,
            ),
          ),
          IconButton(
            onPressed: () {},
            padding: const EdgeInsets.all(0),
            splashRadius: 25,
            icon: SvgPicture.asset(
              "assets/icons/instagram.svg",
              alignment: Alignment.center,
              width: MediaQuery.sizeOf(context).width / 4,
            ),
          ),
          IconButton(
            onPressed: () {},
            padding: const EdgeInsets.all(0),
            splashRadius: 25,
            icon: SvgPicture.asset(
              "assets/icons/dribbble.svg",
              alignment: Alignment.center,
              width: MediaQuery.sizeOf(context).width / 4,
            ),
          ),
          IconButton(
            onPressed: () {},
            padding: const EdgeInsets.all(0),
            splashRadius: 25,
            icon: SvgPicture.asset(
              "assets/icons/x.svg",
              alignment: Alignment.center,
              width: MediaQuery.sizeOf(context).width / 4,
            ),
          ),
        ],
      ),
    );
  }
}
