import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:istu_map/core/presentation/ui/widgets/svg_picture.dart';

class BackgroundIstuLogo extends StatelessWidget {
  const BackgroundIstuLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: 500,
      height: 500,
      bottom: 100,
      left: -100,
      child: OverflowBox(
        child: Opacity(
          opacity: AppTheme.of(context).colorScheme.brightness == Brightness.dark ? 0.4 : 0.1,
          child: const IstuSvgPicture(
            SvgIstuIcons.istuLogoBlack,
            color: Colors.black,
            width: 500,
          ),
        ),
      ),
    );
  }
}
