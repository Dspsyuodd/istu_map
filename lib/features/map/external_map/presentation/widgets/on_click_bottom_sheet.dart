import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
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
              onPressed: () {},
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
                Navigator.of(context).pushNamed('/building_map');
              },
            ),
          ],
        ),
      ),
    );
  }
}
