import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  var transitionEnd = false;
  var blackLogoVisible = false;

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
              blackLogoVisible = true;
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
      body: InkWell(
        onTap: () {
          if (transitionEnd) {
            animationController.reverse().whenComplete(() {
              setState(() {
                transitionEnd = !transitionEnd;
                Future.delayed(const Duration(milliseconds: 200), () {
                  setState(() {
                    blackLogoVisible = false;
                  });
                });
              });
            });
          } else {
            animationController.forward().whenComplete(() {
              setState(() {
                transitionEnd = !transitionEnd;
                Future.delayed(const Duration(milliseconds: 200), () {
                  setState(() {
                    blackLogoVisible = true;
                  });
                });
              });
            });
          }
        },
        child: Stack(
          children: [
            Center(
              child: OverflowBox(
                maxHeight: double.infinity,
                maxWidth: double.infinity,
                child: Visibility(
                  visible: !transitionEnd,
                  child: SvgPicture.asset(
                    'assets/svg/istu_logo_1.svg',
                    width: 250 + 10000 * animation.value,
                    height: 250 + 10000 * animation.value,
                  ),
                ),
              ),
            ),
            Center(
              child: AnimatedOpacity(
                opacity: blackLogoVisible ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                child: SvgPicture.asset(
                  'assets/svg/istu_logo_2.svg',
                  width: 250,
                  height: 250,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
