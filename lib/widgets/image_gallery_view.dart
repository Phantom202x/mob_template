import "dart:io";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart";
import "package:path_provider/path_provider.dart";
import "package:photo_view/photo_view.dart";
import "package:photo_view/photo_view_gallery.dart";
import "package:quiz_template/models/data.dart";
import "package:quiz_template/models/style.dart";

class ImageGalleryView extends StatefulWidget {
  const ImageGalleryView(
      {super.key, required this.imagesUrls, required this.initialImageIndex});
  final List<MyImage> imagesUrls;
  final int initialImageIndex;

  @override
  State<ImageGalleryView> createState() => _ImageGalleryViewState();
}

class _ImageGalleryViewState extends State<ImageGalleryView> {
  late int location, currentIndex;
  bool isVisible = false;
  double fromTop = double.maxFinite;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialImageIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PhotoViewGallery.builder(
              itemCount: widget.imagesUrls.length,
              enableRotation: false,
              scrollPhysics: const BouncingScrollPhysics(),
              wantKeepAlive: true,
              onPageChanged: (index) {
                currentIndex = index;
              },
              pageController: PageController(
                initialPage: widget.initialImageIndex,
              ),
              backgroundDecoration: BoxDecoration(
                color: kBackgroundDarkColor,
              ),
              builder: (context, index) => PhotoViewGalleryPageOptions(
                imageProvider: AssetImage(widget.imagesUrls[index].url),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.contained,
                heroAttributes: PhotoViewHeroAttributes(tag: index),
              ),
            ),
            Positioned(
              top: 5,
              left: 5,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.close_rounded,
                  size: 24,
                  color: kBackgroundLightColor,
                ),
              ),
            ),
            // Positioned(
            //   top: 5,
            //   right: 5,
            //   child: PopupMenuButton(
            //     iconSize: 24,
            //     elevation: 0,
            //     color: kBackgroundLightColor,
            //     itemBuilder: (context) => [
            //       PopupMenuItem(
            //         onTap: () {},
            //         textStyle: TextStyle(
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //           color: kBackgroundDarkColor,
            //         ),
            //         padding:
            //             const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //         child: const Text(
            //           "Set to Home Screen",
            //         ),
            //       ),
            //       PopupMenuItem(
            //         onTap: () {},
            //         textStyle: TextStyle(
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //           color: kBackgroundDarkColor,
            //         ),
            //         padding:
            //             const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //         child: const Text(
            //           "Set to Lock Screen",
            //         ),
            //       ),
            //       PopupMenuItem(
            //         onTap: () {},
            //         textStyle: TextStyle(
            //           fontSize: 18,
            //           fontWeight: FontWeight.bold,
            //           color: kBackgroundDarkColor,
            //         ),
            //         padding:
            //             const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //         child: const Text(
            //           "Set to Both",
            //         ),
            //       ),
            //     ],
            //   ),
            // )
            Positioned(
              top: 5,
              right: 5,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isVisible = true;
                    fromTop = MediaQuery.sizeOf(context).height - 200;
                  });
                },
                icon: Icon(
                  Icons.menu_rounded,
                  size: 24,
                  color: kBackgroundLightColor,
                ),
              ),
            ),
            if (isVisible)
              GestureDetector(
                onTap: () {
                  setState(() {
                    isVisible = false;
                    fromTop = MediaQuery.sizeOf(context).height;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  color: isVisible ? Colors.black54 : Colors.transparent,
                ),
              ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              top: fromTop,
              left: 20,
              child: Container(
                width: MediaQuery.sizeOf(context).width - 40,
                height: 150,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kSecondaryDarkColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () async {
                        location = WallpaperManager.HOME_SCREEN;
                        var bytes = await rootBundle
                            .load(widget.imagesUrls[currentIndex].url);
                        final String path =
                            (await getDownloadsDirectory())!.path;
                        final image = File(
                            "$path/image${widget.imagesUrls[currentIndex].id}.png");
                        await image.writeAsBytes(bytes.buffer.asUint8List(
                            bytes.offsetInBytes, bytes.lengthInBytes));
                        await WallpaperManager.setWallpaperFromFile(
                            image.path, location);
                      },
                      style: TextButton.styleFrom(
                        fixedSize: Size(
                          MediaQuery.sizeOf(context).width - 30,
                          40,
                        ),
                      ),
                      child: Text(
                        "Set to Home Screen",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: kSecondaryLightColor,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        location = WallpaperManager.LOCK_SCREEN;
                        var bytes = await rootBundle
                            .load(widget.imagesUrls[currentIndex].url);
                        final String path =
                            (await getDownloadsDirectory())!.path;
                        final image = File(
                            "$path/image${widget.imagesUrls[currentIndex].id}.png");
                        await image.writeAsBytes(
                          bytes.buffer.asUint8List(
                              bytes.offsetInBytes, bytes.lengthInBytes),
                        );
                        await WallpaperManager.setWallpaperFromFile(
                            image.path, location);
                      },
                      style: TextButton.styleFrom(
                        fixedSize:
                            Size(MediaQuery.sizeOf(context).width - 30, 40),
                      ),
                      child: Text(
                        "Set to Lock Screen",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: kSecondaryLightColor,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        location = WallpaperManager.BOTH_SCREEN;
                        var bytes = await rootBundle
                            .load(widget.imagesUrls[currentIndex].url);
                        final String path =
                            (await getDownloadsDirectory())!.path;
                        final image = File(
                            "$path/image${widget.imagesUrls[currentIndex].id}.png");
                        await image.writeAsBytes(
                          bytes.buffer.asUint8List(
                              bytes.offsetInBytes, bytes.lengthInBytes),
                        );
                        await WallpaperManager.setWallpaperFromFile(
                            image.path, location);
                      },
                      style: TextButton.styleFrom(
                        fixedSize:
                            Size(MediaQuery.sizeOf(context).width - 30, 40),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                      ),
                      child: Text(
                        "Set to Both",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: kSecondaryLightColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
