import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:istu_map/features/object_card/presentation/bloc/object_card_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImagesPageView extends StatefulWidget {
  const ImagesPageView({Key? key}) : super(key: key);

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
    return BlocBuilder<ObjectCardBloc, ObjectCardState>(
      builder: (context, state) {
        return state.maybeWhen(
          loadingSuccess: (cardContent) {
            return Container(
                color: AppTheme.of(context).colorScheme.secondary,
                height: size.height * 0.25,
                width: double.infinity,
                child: cardContent.images != null
                    ? Stack(
                        children: [
                          PageView(
                            controller: pageController,
                            children: cardContent.images!
                                .map(
                                  (imageBytes) => Image.memory(
                                    imageBytes,
                                    fit: BoxFit.cover,
                                  ),
                                )
                                .toList(),
                          ),
                          Align(
                            alignment: const Alignment(0, 0.85),
                            child: SmoothPageIndicator(
                              controller: pageController,
                              count: cardContent.images!.length,
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
                                dotWidth:
                                    size.width / cardContent.images!.length -
                                        ((cardContent.images!.length + 1) * 4),
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
                                Text(cardContent.images!.length.toString())
                              ],
                            ),
                          ),
                        ],
                      )
                    : const Center(child: CircularProgressIndicator()));
          },
          orElse: () {
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}
