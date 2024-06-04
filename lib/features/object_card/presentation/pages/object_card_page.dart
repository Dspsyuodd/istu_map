import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istu_map/features/authentication/authentication_injection_container.dart';
import 'package:istu_map/features/object_card/presentation/bloc/object_card_bloc.dart';
import 'package:istu_map/features/object_card/presentation/widgets/object_card_images_view.dart';
import 'package:istu_map/features/object_card/presentation/widgets/object_card_content.dart';

class ObjectCardPage extends StatelessWidget {
  const ObjectCardPage(
      {Key? key,
      required this.objectId,
      this.showCommentsField = true,
      this.onRouteCreatePressed})
      : super(key: key);
  final String objectId;
  final bool showCommentsField;
  final void Function()? onRouteCreatePressed;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<ObjectCardBloc>()..add(ObjectCardEvent.cardOpened(objectId)),
      child: Scaffold(
        body: Stack(
          children: [
            const ObjecCardImagesView(),
            ObjectCardContent(
              onRouteCreatePressed: onRouteCreatePressed,
              showCommentsField: showCommentsField,
            ),
          ],
        ),
      ),
    );
  }
}
