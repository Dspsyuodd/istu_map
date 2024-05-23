import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../core/presentation/ui/widgets/svg_picture.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  var transitionEnd = false;
  var blackLogoVisility = 0.0;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInExpo))
      ..addListener(() {
        setState(() {});
      });
    Future.delayed(const Duration(seconds: 2), () {
      animationController.forward().whenComplete(() {
        setState(() {
          transitionEnd = !transitionEnd;
          Future.delayed(const Duration(milliseconds: 200), () {
            setState(() {
              blackLogoVisility = 1;
            });
          });
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: transitionEnd
          ? theme.colorScheme.secondary
          : theme.colorScheme.background,
      body: Stack(
        children: [
          Center(
            child: OverflowBox(
              maxHeight: double.infinity,
              maxWidth: double.infinity,
              child: Visibility(
                visible: !transitionEnd,
                child: IstuSvgPicture(
                  SvgIstuIcons.istuLogoColored,
                  width: 250 + 10000 * animation.value,
                  height: 250 + 10000 * animation.value,
                ),
              ),
            ),
          ),
          Center(
            child: AnimatedOpacity(
              opacity: blackLogoVisility,
              duration: const Duration(milliseconds: 200),
              child: const IstuSvgPicture(
                SvgIstuIcons.istuLogoBlack,
                width: 250,
                height: 250,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
