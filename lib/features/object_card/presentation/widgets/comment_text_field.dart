import 'dart:io';

import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:istu_map/features/object_card/presentation/bloc/object_card_bloc.dart';

class CommentTextField extends StatefulWidget {
  const CommentTextField({Key? key}) : super(key: key);

  @override
  State<CommentTextField> createState() => _CommentTextFieldState();
}

class _CommentTextFieldState extends State<CommentTextField> {
  var commentText = '';
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          child: const Icon(Icons.add_a_photo),
          onTap: () async {
            var imagePicker = ImagePicker();
            final XFile? image =
                await imagePicker.pickImage(source: ImageSource.gallery);
            if (image != null) {
              if (!context.mounted) return;
              BlocProvider.of<ObjectCardBloc>(context)
                  .add(ObjectCardEvent.imageAdded(File(image.path)));
            }
          },
        ),
        const Gap(20),
        Expanded(
          child: SizedBox(
            height: 50,
            child: TextField(
              controller: controller,
              onChanged: (comment) => commentText = comment,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: 'Напишите комментарий...',
                labelStyle: AppTheme.of(context).textTheme.titleSmall,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ),
        const Gap(10),
        InkWell(
          child: const Icon(Icons.send),
          onTap: () {
            if (commentText.isNotEmpty) {
              controller.clear();
              BlocProvider.of<ObjectCardBloc>(context)
                  .add(ObjectCardEvent.commentCreated(commentText));
            }
          },
        ),
      ],
    );
  }
}
