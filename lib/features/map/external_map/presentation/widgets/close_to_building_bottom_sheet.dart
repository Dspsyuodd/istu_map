import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../shared/domain/entities/building.dart';
import 'map_bottom_sheet.dart';

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
                Navigator.of(context).pushNamed('/building_map');
              },
            ),
          ],
        ),
      ),
    );
  }
}
