import 'package:flutter/material.dart';

class MapFocusButton extends StatelessWidget {
  const MapFocusButton({Key? key, this.onTap}) : super(key: key);
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 27, bottom: 38),
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: 61,
            height: 61,
            decoration: const BoxDecoration(
                color: Colors.black, shape: BoxShape.circle),
            child: const Icon(
              Icons.navigation,
              size: 35,
            ),
          ),
        ),
      ),
    );
  }
}
