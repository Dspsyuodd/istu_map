import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istu_map/features/authentication/authentication_injection_container.dart';
import 'package:istu_map/features/object_card/presentation/bloc/object_card_bloc.dart';
import 'package:istu_map/features/object_card/presentation/widgets/images_page_view.dart';
import 'package:istu_map/features/object_card/presentation/widgets/object_card_content.dart';

class ObjectCardPage extends StatelessWidget {
  const ObjectCardPage({Key? key, required this.objectId}) : super(key: key);
  final String objectId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<ObjectCardBloc>()..add(ObjectCardEvent.cardOpened(objectId)),
      child: const Scaffold(
        body: Stack(
          children: [
            ImagesPageView(),
            ObjectCardContent(),
          ],
        ),
      ),
    );
  }
}
