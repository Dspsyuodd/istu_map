import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:istu_map/config/theme/app_theme/app_theme.dart';
import 'package:istu_map/features/map/shared/presentation/widgets/map_bottom_sheet.dart';
import 'package:istu_map/features/map/internal_map/presintation/bloc/building_map_bloc.dart';
import 'package:istu_map/features/object_card/presentation/pages/object_card_page.dart';
import 'package:istu_map/features/user/presentation/bloc/user_bloc.dart';

class ObjectBottomSheet extends StatelessWidget {
  const ObjectBottomSheet({Key? key, required this.title, required this.id})
      : super(key: key);
  final String title;
  final String id;

  @override
  Widget build(BuildContext context) {
    return MapBottomSheet(
      title: title,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: MapBottomSheetButton(
                    color: AppTheme.of(context).colorScheme.primary,
                    text: "Описание",
                    icon: const Icon(Icons.chat),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ObjectCardPage(
                            objectId: id,
                            onRouteCreatePressed: () {
                              BlocProvider.of<BuildingMapBloc>(context).add(
                                InternalRouteCreated(toId: id),
                              );
                              Navigator.pop(context);
                            },
                            showCommentsField:
                                BlocProvider.of<UserBloc>(context).state.maybeMap(
                                      success: (value) => value.user.role == 2,
                                      orElse: () => false,
                                    ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: MapBottomSheetButton(
                    color: AppTheme.of(context).colorScheme.secondary,
                    text: "Маршрут",
                    icon: const Icon(Icons.route),
                    onPressed: () {
                      BlocProvider.of<BuildingMapBloc>(context).add(
                        InternalRouteCreated(toId: id),
                      );
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: MapBottomSheetButton(
              color: AppTheme.of(context).colorScheme.secondary,
              text: "Маршрут отсюда",
              icon: const Icon(Icons.route),
              onPressed: () {
                BlocProvider.of<BuildingMapBloc>(context).add(
                  InternalRouteCreated(fromId: id),
                );
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
