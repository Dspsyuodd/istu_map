import 'package:app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:istu_map/core/presentation/ui/widgets/svg_picture.dart';
import 'package:istu_map/features/object_card/presentation/bloc/object_card_bloc.dart';
import 'package:istu_map/features/object_card/presentation/widgets/comment_text_field.dart';
import 'package:istu_map/features/object_card/presentation/widgets/comment_view.dart';

class ObjectCardContent extends StatelessWidget {
  const ObjectCardContent(
      {Key? key, this.showCommentsField = true, this.onRouteCreatePressed})
      : super(key: key);
  final bool showCommentsField;
  final void Function()? onRouteCreatePressed;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<ObjectCardBloc, ObjectCardState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: size.height * 0.76,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppTheme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: IstuSvgPicture(
                    SvgIstuIcons.istuLogoBlack,
                    color: Colors.black.withOpacity(0.05),
                    width: 400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: state.maybeWhen(
                    loadingSuccess: (cardContent) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                cardContent.card.title,
                                style:
                                    AppTheme.of(context).textTheme.titleLarge,
                              ),
                              InkWell(
                                child: const Icon(Icons.close),
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                cardContent.card.address,
                                style:
                                    AppTheme.of(context).textTheme.titleSmall,
                              ),
                              ElevatedButton(
                                onPressed: onRouteCreatePressed,
                                child: const Row(
                                  children: [
                                    Text('Маршрут'),
                                    Icon(Icons.route)
                                  ],
                                ),
                              )
                            ],
                          ),
                          const Gap(20),
                          if (cardContent.card.description != null)
                            Text(cardContent.card.description ??
                                "Без описания."),
                          const Gap(20),
                          Divider(
                            color: Colors.white.withOpacity(0.1),
                          ),
                          const Text(
                            'Комментарии',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            cardContent.comments.length.toString() +
                                _getCommentsWordByNumber(
                                    cardContent.comments.length),
                            style: AppTheme.of(context).textTheme.titleSmall,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: cardContent.comments.length,
                              itemBuilder: (context, index) {
                                return CommentView(
                                  comment: cardContent.comments[
                                      cardContent.comments.length - index - 1],
                                );
                              },
                            ),
                          ),
                          if (showCommentsField) const CommentTextField(),
                        ],
                      );
                    },
                    orElse: () => const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _getCommentsWordByNumber(int number) {
    if (number % 10 == 1 && number % 100 != 11) {
      return ' комментарий';
    } else if (number % 10 >= 2 &&
        number % 10 <= 4 &&
        (number % 100 < 10 || number % 100 >= 20)) {
      return ' комментария';
    } else {
      return ' комментариев';
    }
  }
}
