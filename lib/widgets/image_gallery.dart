import 'package:flutter/material.dart';
import 'package:quiz_template/models/data.dart';
import 'package:quiz_template/widgets/image_gallery_view.dart';

class GridImages extends StatelessWidget {
  const GridImages({super.key, required this.imagesUrl});
  final List<MyImage> imagesUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: imagesUrl.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.sizeOf(context).width > 400 ? 3 : 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return FadeTransition(
                    opacity: Tween<double>(begin: 0, end: 1).animate(
                      animation.drive(CurveTween(curve: Curves.easeInOut)),
                    ),
                    child: ImageGalleryView(
                      imagesUrls: imagesUrl,
                      initialImageIndex: index,
                    ),
                  );
                },
                transitionDuration: const Duration(milliseconds: 500),
              ),
            );
          },
          child: Hero(
            tag: imagesUrl[index].id,
            child: Image.asset(
              imagesUrl[index].url,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
