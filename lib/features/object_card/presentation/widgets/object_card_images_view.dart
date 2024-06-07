import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istu_map/config/theme/app_theme/app_theme.dart';
import 'package:istu_map/features/object_card/presentation/bloc/object_card_bloc.dart';
import 'package:istu_map/features/object_card/presentation/widgets/images_page_view.dart';

class ObjecCardImagesView extends StatefulWidget {
  const ObjecCardImagesView({Key? key}) : super(key: key);

  @override
  State<ObjecCardImagesView> createState() => _ObjecCardImagesViewState();
}

class _ObjecCardImagesViewState extends State<ObjecCardImagesView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<ObjectCardBloc, ObjectCardState>(
      builder: (context, state) {
        return state.maybeWhen(
          loadingSuccess: (cardContent) {
            Widget imageView;
            if (cardContent.images == null) {
              imageView = const Center(child: CircularProgressIndicator());
            } else if (cardContent.images!.isEmpty) {
              imageView = const Center(child: Text('Изображений нет'));
            } else {
              imageView = ImagesPageView(images: cardContent.images!);
            }
            return Container(
              color: AppTheme.of(context).colorScheme.secondary,
              height: size.height * 0.25,
              width: double.infinity,
              child: imageView,
            );
          },
          orElse: () {
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}
