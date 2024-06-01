import 'package:flutter/material.dart';
import 'package:istu_map/core/presentation/ui/widgets/svg_picture.dart';

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
