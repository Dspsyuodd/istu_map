import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:istu_map/features/map/internal_map/presintation/pages/building_map.dart';
import 'package:istu_map/features/object_card/presentation/pages/object_card_page.dart';
import 'package:istu_map/features/user/presentation/bloc/user_bloc.dart';
import '../bloc/map_bloc.dart';
import 'map_bottom_sheet.dart';
import '../../../shared/domain/entities/building.dart';

class OnClickBottomSheet extends StatelessWidget {
  const OnClickBottomSheet({Key? key, required this.building})
      : super(key: key);
  final Building building;

  @override
  Widget build(BuildContext context) {
    return MapBottomSheet(
      title: building.title,
      content: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MapBottomSheetButton(
              color: AppTheme.of(context).colorScheme.primary,
              text: "Комментарии",
              icon: const Icon(Icons.chat),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ObjectCardPage(objectId: building.id),
                  ),
                );
              },
            ),
            const Gap(10),
            MapBottomSheetButton(
              color: AppTheme.of(context).colorScheme.secondary,
              text: "Маршрут",
              icon: const Icon(Icons.route),
              onPressed: () {
                BlocProvider.of<MapBloc>(context).add(
                  RouteCreated(to: building),
                );
                Navigator.pop(context);
              },
            ),
            const Gap(10),
            MapBottomSheetButton(
              color: AppTheme.of(context).colorScheme.primary,
              text: "Карта",
              icon: const Icon(Icons.map),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<UserBloc>(context),
                            child: BuildingMap(building: building),
                          )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}