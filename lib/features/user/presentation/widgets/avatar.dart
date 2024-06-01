import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar(
      {Key? key,
      required this.size,
      this.borderColor = Colors.black,
      this.fillColor = Colors.white,
      required this.text})
      : super(key: key);
  final double size;
  final Color borderColor;
  final Color fillColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: borderColor,
      ),
      child: Center(
        child: CircleAvatar(
          radius: size / 2 - 5,
          backgroundColor: fillColor,
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: size / 3),
            ),
          ),
        ),
      ),
    );
  }
}
