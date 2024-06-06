import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class SearchResultElement extends StatelessWidget {
  const SearchResultElement({Key? key, this.onTap, required this.text})
      : super(key: key);
  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:
                  AppTheme.of(context).colorScheme.secondary.withOpacity(0.6),
            ),
            height: 50,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  text,
                  style: AppTheme.of(context).textTheme.displaySmall,
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(top: 10, right: 9),
              child: RotatedBox(
                quarterTurns: 1,
                child: InkWell(
                  child: Icon(
                    Icons.assistant_navigation,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
