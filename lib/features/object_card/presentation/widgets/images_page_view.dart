import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImagesPageView extends StatefulWidget {
  const ImagesPageView({Key? key, required this.images}) : super(key: key);
  final List<Uint8List> images;

  @override
  State<ImagesPageView> createState() => _ImagesPageViewState();
}

class _ImagesPageViewState extends State<ImagesPageView> {
  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        PageView(
          controller: pageController,
          children: widget.images
              .map(
                (imageBytes) => GestureDetector(
                  onTap: () {
                    showAdaptiveDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) => AlertDialog(
                              content: Image.memory(
                                imageBytes,
                                fit: BoxFit.cover,
                              ),
                            ));
                  },
                  child: Image.memory(
                    imageBytes,
                    fit: BoxFit.cover,
                  ),
                ),
              )
              .toList(),
        ),
        Align(
          alignment: const Alignment(0, 0.85),
          child: SmoothPageIndicator(
            controller: pageController,
            count: widget.images.length,
            onDotClicked: (index) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
              );
            },
            effect: WormEffect(
              radius: 0,
              spacing: 8,
              dotHeight: 2,
              activeDotColor: Colors.white,
              dotWidth: size.width / widget.images.length -
                  ((widget.images.length + 1) * 4),
            ),
          ),
        ),
        Align(
          alignment: const Alignment(0.9, 0.75),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
              const Gap(5),
              Text(widget.images.length.toString())
            ],
          ),
        ),
      ],
    );
  }
}
