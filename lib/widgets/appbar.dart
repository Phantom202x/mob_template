import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_template/models/language.dart';
import 'package:quiz_template/models/style.dart';

class TemplateAppBar extends StatelessWidget {
  const TemplateAppBar(
      {super.key,
      this.useSettings = false,
      this.useAbout = false,
      this.canPop = false,
      required this.title,
      this.child,
      this.isCenter});
  final bool useSettings, useAbout, canPop;
  final bool? isCenter;
  final Widget? child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold Color
      backgroundColor: kBackgroundLightColor,
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 0,
        centerTitle: isCenter,
        leading: canPop
            ? Directionality(
                textDirection: context.read<Language>().currentIndex == 1
                    ? TextDirection.ltr
                    : TextDirection.rtl,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 24,
                  ),
                ),
              )
            : null,
        title: Text(
          title,
          style: kNormalStyle,
        ),
        // AppBar Background
        backgroundColor: kBackgroundDarkColor,
        actions: [
          useSettings
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings_rounded,
                    size: 24,
                    color: kBackgroundLightColor,
                  ),
                )
              : const SizedBox(),
          useAbout
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.info_rounded,
                    size: 24,
                    color: kBackgroundLightColor,
                  ),
                )
              : const SizedBox(),
        ],
      ),
      body: child,
    );
  }
}
