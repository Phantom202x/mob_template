import 'package:flutter/material.dart';
import 'package:quiz_template/models/style.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer(
      {super.key,
      required this.borderRadius,
      this.imageName,
      this.title,
      this.useShadow,
      this.useGradiant});
  final double borderRadius;
  final bool? useShadow, useGradiant;
  final String? imageName, title;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.2,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: useShadow == true
              ? [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ]
              : null,
          color: kBackgroundDarkColor,
        ),
        child: imageName == null
            ? Text(
                title!,
                style: kHeaddingStyle,
              )
            : Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(borderRadius),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/$imageName"),
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                          useGradiant == true
                              ? Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Colors.black12,
                                          Colors.black38,
                                          Colors.black12
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                  title == null
                      ? const SizedBox()
                      : Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: MediaQuery.sizeOf(context).width - 40,
                          decoration: BoxDecoration(
                            color: kBackgroundDarkColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(borderRadius),
                              bottomRight: Radius.circular(borderRadius),
                            ),
                          ),
                          child: Text(
                            title!,
                            style: kNormalStyle,
                          ),
                        ),
                ],
              ),
      ),
    );
  }
}
