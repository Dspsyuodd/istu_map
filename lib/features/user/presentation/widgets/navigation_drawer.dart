import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:istu_map/features/user/presentation/bloc/user_bloc.dart';
import 'package:istu_map/features/user/presentation/widgets/background_istu_logo.dart';
import 'package:istu_map/features/user/presentation/widgets/navigation_drawer_button.dart';
import '../../../authentication/presentation/widgets/logout_button.dart';
import 'avatar.dart';

class IstuNavigationDrawer extends StatelessWidget {
  const IstuNavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: MediaQuery.of(context).size.width * 0.78,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(color: Colors.black, offset: Offset(1, 0), blurRadius: 10)
        ],
        color: AppTheme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppTheme.of(context).colorScheme.primary,
            Colors.black,
          ],
        ),
      ),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            children: [
              const BackgroundIstuLogo(),
              Padding(
                padding: const EdgeInsets.only(left: 23, right: 20, top: 62),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        state.maybeWhen(
                          success: (user, _, __) => Avatar(
                            size: 80,
                            borderColor: Colors.black,
                            text: user.firstName[0] + user.lastName[0],
                          ),
                          orElse: () => const Avatar(
                            size: 80,
                            borderColor: Colors.black,
                            text: 'A',
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            AppTheme.changeTheme(context, AppColorThemes.light);
                          },
                          child: const Icon(
                            Icons.light_mode_outlined,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: state.maybeWhen(
                        success: (user, _, __) {
                          return [
                            Text(
                              [user.firstName, user.lastName].join(' '),
                              style: const TextStyle(fontSize: 18),
                            ),
                            Opacity(
                              opacity: 0.54,
                              child: Text(
                                user.email,
                                style: const TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ];
                        },
                        orElse: () => [
                          const Text(
                            'Незарегистрированный пользователь',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 57,
                    ),
                    const Column(
                      children: [
                        NavigationDrawerButton(
                          icon: Icon(Icons.person),
                          text: 'Профиль',
                        ),
                        NavigationDrawerButton(
                          icon: Icon(Icons.settings),
                          text: 'Настройки',
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: LogoutButton(),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
