import 'dart:math' as math;

import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../core/ui/widgets/svg_picture.dart';

class AuthorizaitonScreen extends StatelessWidget {
  const AuthorizaitonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const TopLogo(),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.38,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 31),
                    child: Text(
                      'Вход',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'E-mail',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Пароль',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/map');
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width / 2, 42),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        backgroundColor:
                            AppTheme.of(context).colorScheme.secondary),
                    child: const Text(
                      'Войти',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthorizationClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const curveSize = 45;
    Path path = Path();
    path.lineTo(0, size.height - curveSize);
    path.quadraticBezierTo(size.width / 4, size.height - curveSize * 2,
        size.width / 2, size.height - curveSize);
    path.quadraticBezierTo(
        (size.width / 4) * 3, size.height, size.width, size.height - curveSize);
    path.lineTo(size.width, size.height - curveSize);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class TopLogo extends StatelessWidget {
  const TopLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: 15,
          width: MediaQuery.of(context).size.width,
          child: Transform.rotate(
            angle: 3 * math.pi / 180,
            child: Transform.scale(
              scale: 1.1,
              child: ClipPath(
                clipper: AuthorizationClipper(),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: BoxDecoration(
                    color: AppTheme.of(context)
                        .colorScheme
                        .primary
                        .withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
        ),
        ClipPath(
          clipper: AuthorizationClipper(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(
              color: AppTheme.of(context).colorScheme.secondary,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IstuSvgPicture(SvgIstuIcons.istuLogoBlack,
                    width: 130, height: 130),
                SizedBox(width: 34),
                Text(
                  'Личный\nкабинет',
                  style: TextStyle(fontSize: 32),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
