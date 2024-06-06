import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../authentication_injection_container.dart';
import '../bloc/authentication_bloc.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (blocContext) => sl<AuthenticationBloc>(),
      child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (BuildContext context, AuthenticationState state) {
          if (state is LogoutSuccess) {
            Navigator.of(context).popUntil((predicate) => predicate.isFirst);
            Navigator.of(context).pushReplacementNamed('/auth');
          }
        },
        builder: (context, state) {
          final color = AppTheme.of(context).colorScheme.brightness ==
                            Brightness.dark
                        ? AppTheme.of(context).colorScheme.primary
                        : Colors.black;
          return InkWell(
            onTap: () {
              BlocProvider.of<AuthenticationBloc>(context)
                  .add(const LogoutEvent());
            },
            child: Row(
              children: [
                Text(
                  'Выйти',
                  style: TextStyle(
                    color: color,
                    decoration: TextDecoration.underline,
                    decorationColor: color,
                  ),
                ),
                const Gap(5),
                Icon(
                  Icons.logout,
                  color: color,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
