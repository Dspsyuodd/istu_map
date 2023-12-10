import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class SvgIstuIcons {
  static const istuLogoColored =
      SvgIstuIconData("assets/svg/istu_logo_colored.svg");
  static const istuLogoBlack =
      SvgIstuIconData("assets/svg/istu_logo_black.svg");
}

class SvgIstuIconData {
  final String assetPath;
  const SvgIstuIconData(this.assetPath);
}

class IstuSvgPicture extends StatelessWidget {
  const IstuSvgPicture(this.iconData, {Key? key, this.width, this.height})
      : super(key: key);

  final SvgIstuIconData iconData;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(iconData.assetPath, width: width, height: height);
  }
}
