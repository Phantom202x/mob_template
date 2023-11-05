import 'package:flutter/material.dart';
import 'package:quiz_template/models/style.dart';

class ExpandedButton extends StatelessWidget {
  const ExpandedButton({super.key, required this.icon, required this.label, required this.onPressed});
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: kBackgroundDarkColor,
          fixedSize: Size(MediaQuery.sizeOf(context).width - 40, 45),
          alignment: Alignment.centerLeft,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: kBackgroundLightColor,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              label,
              style: kNormalStyle,
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 24,
              color: kBackgroundLightColor,
            ),
          ],
        ));
  }
}
