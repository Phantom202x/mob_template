import 'package:flutter/material.dart';
import 'package:quiz_template/models/data.dart';
import 'package:quiz_template/models/style.dart';

class ToImageGallery extends StatelessWidget {
  const ToImageGallery(
      {super.key,
      required this.radius,
      required this.label,
      this.useGradiant,
      this.widget = const Text("Use a Widget Please")});
  final double radius;
  final String label;
  final bool? useGradiant;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.2,
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => widget,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(radius),
                color: kBackgroundDarkColor,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: Column(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(images[0].url),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(images[1].url),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(images[2].url),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(images[3].url),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ),
            if (useGradiant == true)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  gradient: const LinearGradient(
                      colors: [Colors.black38, Colors.black54, Colors.black38],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
              ),
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: kBackgroundDarkColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 100,
                    color: kBackgroundLightColor,
                    offset: Offset.zero,
                    spreadRadius: 7,
                  ),
                ],
              ),
              child: Text(
                label,
                style: kHeaddingStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
