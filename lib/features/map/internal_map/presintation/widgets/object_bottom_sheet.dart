import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
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
      content: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                return MapBottomSheetButton(
                  color: AppTheme.of(context).colorScheme.primary,
                  text: "Комментарии",
                  icon: const Icon(Icons.chat),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ObjectCardPage(
                          objectId: id,
                          onRouteCreatePressed: () {
                            BlocProvider.of<BuildingMapBloc>(context).add(
                              RouteCreated(toId: id),
                            );
                            Navigator.pop(context);
                          },
                          showCommentsField: state.maybeMap(
                            success: (value) => value.user.role == 2,
                            orElse: () => false,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const Gap(10),
            MapBottomSheetButton(
              color: AppTheme.of(context).colorScheme.secondary,
              text: "Маршрут",
              icon: const Icon(Icons.route),
              onPressed: () {
                BlocProvider.of<BuildingMapBloc>(context).add(
                  RouteCreated(toId: id),
                );
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
