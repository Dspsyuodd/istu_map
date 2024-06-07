import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:istu_map/config/theme/app_theme/app_theme.dart';
import '../../../../core/presentation/ui/widgets/svg_picture.dart';
import 'dart:math' as math;

class AuthorizationLogoClipper extends CustomClipper<Path> {
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
                clipper: AuthorizationLogoClipper(),
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
          clipper: AuthorizationLogoClipper(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(
              color: AppTheme.of(context).colorScheme.secondary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const IstuSvgPicture(SvgIstuIcons.istuLogoBlack,
                    width: 130, height: 130),
                const SizedBox(width: 34),
                Text(
                  'ИжГТУ',
                  style: AppTheme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 32),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
