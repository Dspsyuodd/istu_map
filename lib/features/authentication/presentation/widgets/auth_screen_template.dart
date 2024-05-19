import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:istu_map/features/authentication/presentation/widgets/top_logo.dart';

class AuthScreenTemplate extends StatefulWidget {
  const AuthScreenTemplate({Key? key, required this.content}) : super(key: key);
  final List<Widget> content;

  @override
  State<AuthScreenTemplate> createState() => _AuthScreenTemplateState();
}

class _AuthScreenTemplateState extends State<AuthScreenTemplate> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: KeyboardVisibilityBuilder(
          builder: (context, isKeyboardVisible) {
            return Stack(
              children: [
                AnimatedPositioned(
                  top: isKeyboardVisible
                      ? -MediaQuery.of(context).size.height * 0.35 + 100
                      : 0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                  child: const TopLogo(),
                ),
                ...widget.content,
              ],
            );
          },
        ),
      ),
    );
  }
}
