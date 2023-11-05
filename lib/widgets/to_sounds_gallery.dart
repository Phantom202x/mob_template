import 'package:flutter/material.dart';
import 'package:quiz_template/models/style.dart';

class ToSoundsGallery extends StatelessWidget {
  const ToSoundsGallery(
      {super.key,
      required this.label,
      required this.radius,
      required this.onPressed,});
  final String label;
  final double radius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: kBackgroundDarkColor,
          ),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Row(
              children: [
                Icon(
                  Icons.volume_up_rounded,
                  size: 50,
                  color: kBackgroundLightColor,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  label,
                  style: kHeaddingStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
