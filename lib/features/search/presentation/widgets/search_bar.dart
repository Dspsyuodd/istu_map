import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:istu_map/config/theme/app_theme/app_theme.dart';
import 'package:istu_map/features/user/presentation/bloc/user_bloc.dart';

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
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                return state.maybeWhen(
                  success: (user, _, __) {
                    return Avatar(
                      text: user.firstName[0] + user.lastName[0],
                      size: 44,
                      borderColor: AppTheme.of(context).colorScheme.secondary,
                    );
                  },
                  orElse: () {
                    return Avatar(
                      text: 'A',
                      size: 44,
                      borderColor: AppTheme.of(context).colorScheme.secondary,
                    );
                  },
                );
              },
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
