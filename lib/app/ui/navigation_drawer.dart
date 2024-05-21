import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:istu_map/features/authentication/presentation/widgets/logout.dart';
import 'avatar.dart';
import '../../core/ui/widgets/svg_picture.dart';

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
      child: Stack(
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
                    const Avatar(size: 80, borderColor: Colors.black),
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
                const SizedBox(
                  height: 20,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Карелин Вадим',
                      style: TextStyle(fontSize: 18),
                    ),
                    Opacity(
                      opacity: 0.54,
                      child: Text(
                        'Студент 4 курса',
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 57,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      for (var i = 0; i < 10; i++)
                        const Padding(
                          padding: EdgeInsets.only(bottom: 25),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 13),
                                child: Opacity(
                                  opacity: 0.56,
                                  child: Icon(Icons.settings_outlined),
                                ),
                              ),
                              Text('Настройки'),
                            ],
                          ),
                        ),
                        const Logout(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundIstuLogo extends StatelessWidget {
  const BackgroundIstuLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      width: 500,
      height: 500,
      bottom: 100,
      left: -100,
      child: OverflowBox(
        child: Opacity(
          opacity: 0.4,
          child: IstuSvgPicture(
            SvgIstuIcons.istuLogoBlack,
            width: 500,
          ),
        ),
      ),
    );
  }
}
