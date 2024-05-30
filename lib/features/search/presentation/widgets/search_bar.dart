import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../user/presentation/widgets/avatar.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({Key? key, this.onSearchTap, this.onAvatarTap})
      : super(key: key);
  final void Function()? onSearchTap;
  final void Function()? onAvatarTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onAvatarTap,
            child: Avatar(
              size: 44,
              borderColor: AppTheme.of(context).colorScheme.secondary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11),
            child: GestureDetector(
              onTap: onSearchTap,
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10000),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text(
                      'Поиск',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 44,
          ),
        ],
      ),
    );
  }
}
