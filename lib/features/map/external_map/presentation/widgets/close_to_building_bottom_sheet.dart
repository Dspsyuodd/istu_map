import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istu_map/config/theme/app_theme/app_theme.dart';
import 'package:istu_map/features/map/external_map/presentation/bloc/map_bloc.dart';
import 'package:istu_map/features/map/internal_map/presintation/pages/building_map.dart';
import 'package:istu_map/features/user/presentation/bloc/user_bloc.dart';

import '../../../shared/domain/entities/building.dart';
import '../../../shared/presentation/widgets/map_bottom_sheet.dart';

class CloseToBuildingBottomSheet extends StatelessWidget {
  const CloseToBuildingBottomSheet({Key? key, required this.building})
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
              text: "Карта",
              icon: const Icon(Icons.map),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<MapBloc>(context),
                      child: BlocProvider.value(
                        value: BlocProvider.of<UserBloc>(context),
                        child: BuildingMap(building: building),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
