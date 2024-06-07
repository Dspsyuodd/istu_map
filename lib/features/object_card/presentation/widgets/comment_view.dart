import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:istu_map/config/theme/app_theme/app_theme.dart';
import 'package:istu_map/features/object_card/domain/entities/comment.dart';
import 'dart:math' as math;

class CommentView extends StatelessWidget {
  const CommentView({Key? key, required this.comment}) : super(key: key);
  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor:
                      Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                          .withOpacity(1.0),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                const Gap(10),
                Text(
                  comment.creatorName,
                  style: AppTheme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
            const Gap(5),
            Text(
              comment.text,
              style: AppTheme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
