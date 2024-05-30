import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:istu_map/features/object_card/domain/entities/comment.dart';
import 'package:istu_map/features/object_card/domain/entities/object_card.dart';

part 'card_content.freezed.dart';

@freezed
class CardContent with _$CardContent {
  const factory CardContent({
    required final ObjectCard card,
    required final List<Comment> comments,
    final List<Uint8List>? images,
  }) = _CardContent;

  factory CardContent.empty() => const CardContent(
        card: ObjectCard(
            objectId: '',
            title: '',
            description: '',
            address: '',
            contentType: 0,
            imageIds: []),
        comments: [],
      );
}
