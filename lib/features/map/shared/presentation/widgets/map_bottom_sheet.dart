import 'package:flutter/material.dart';
import 'package:istu_map/config/theme/app_theme/app_theme.dart';

class MapBottomSheet extends StatelessWidget {
  const MapBottomSheet({Key? key, required this.title, required this.content})
      : super(key: key);

  final String title;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 7,
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: AppTheme.of(context).textTheme.displayLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    color: Colors.grey,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close_rounded,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            if (content != null)
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 60,
                ),
                child: content!,
              ),
          ],
        ),
      ),
    );
  }
}

class MapBottomSheetButton extends StatelessWidget {
  const MapBottomSheetButton({
    Key? key,
    required this.color,
    this.onPressed,
    this.icon,
    required this.text,
  }) : super(key: key);
  final Color color;
  final void Function()? onPressed;
  final Widget? icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor:
            AppTheme.of(context).colorScheme.brightness == Brightness.dark
                ? Colors.black
                : Colors.white,
      ),
      onPressed: onPressed,
      icon: icon,
      label: Text(text),
    );
  }
}
