import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istu_map/features/authentication/authentication_injection_container.dart';
import 'package:istu_map/features/object_card/presentation/bloc/object_card_bloc.dart';

class ObjectCardPage extends StatelessWidget {
  const ObjectCardPage({Key? key, required this.objectId}) : super(key: key);
  final String objectId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<ObjectCardBloc>()..add(ObjectCardEvent.cardOpened(objectId)),
      child: Scaffold(
        body: BlocBuilder<ObjectCardBloc, ObjectCardState>(
          builder: (context, state) {
            return state.maybeWhen(
              success: (cardContent) {
                return Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: PageView(
                          children:
                              cardContent.images.map(Image.memory).toList()),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppTheme.of(context).colorScheme.primary,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cardContent.card.title,
                              style: AppTheme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              cardContent.card.address,
                              style: AppTheme.of(context).textTheme.titleSmall,
                            ),
                            if (cardContent.card.description != null)
                              Text(cardContent.card.description!),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              orElse: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
