import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:istu_map/features/object_card/domain/entities/comment.dart';
import 'package:istu_map/features/object_card/domain/entities/object_card.dart';

class CardContent extends Equatable {
  final ObjectCard card;
  final List<Comment> comments;
  final List<Uint8List> images;

  const CardContent(
      {required this.card, required this.comments, required this.images});

  @override
  List<Object?> get props => [card, comments, images];
}
