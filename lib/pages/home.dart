import 'package:flutter/material.dart';
import 'package:quiz_template/models/data.dart';
import 'package:quiz_template/pages/sounds_gallery.dart';
import 'package:quiz_template/pages/text_page.dart';
import 'package:quiz_template/widgets/app_container.dart';
import 'package:quiz_template/widgets/appbar.dart';
import 'package:quiz_template/widgets/buttons_row.dart';
import 'package:quiz_template/widgets/expanded_button.dart';
import 'package:quiz_template/widgets/image_container.dart';
import 'package:quiz_template/widgets/to_images_gallery.dart';
import 'package:quiz_template/widgets/to_sounds_gallery.dart';

import 'my_gallery.dart';
import 'new_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateAppBar(
      useSettings: true,
      useAbout: true,
      title: "Test",
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NewPage(),
                ),
              ),
              child: const ImageContainer(
                borderRadius: 15,
                imageName: "Soltani1.png",
                title: "Test Container",
                useGradiant: true,
                useShadow: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SocialButtonsRow(),
            const SizedBox(
              height: 20,
            ),
            ExpandedButton(
              icon: Icons.mail_rounded,
              label: "Test",
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const TextPage(),
                    transitionDuration: const Duration(milliseconds: 500),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      var curve = Curves.easeInOut;
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(1, 0),
                          end: const Offset(0, 0),
                        ).animate(
                          animation.drive(
                            CurveTween(curve: curve),
                          ),
                        ),
                        child: child,
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            // ToImageGallery(radius: 20, label: "label"),
            const ToImageGallery(
              radius: 20,
              label: "To Gallery",
              useGradiant: true,
              widget: MyGallery(),
            ),
            const SizedBox(
              height: 20,
            ),
            ToSoundsGallery(
              label: "label",
              radius: 20,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SoundsGallery(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AppContainer(
              image: images[1],
            ),
          ],
        ),
      ),
    );
  }
}
