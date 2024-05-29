import 'package:freezed_annotation/freezed_annotation.dart';

part 'object_card.freezed.dart';
part 'object_card.g.dart';

@freezed
class ObjectCard with _$ObjectCard {
  const factory ObjectCard(
      {required String objectId,
      required String title,
      required String? description,
      required String address,
      required int contentType,
      required List<String> imageIds,
      required}) = _ObjectCard;

  factory ObjectCard.fromJson(Map<String, dynamic> json) =>
      _$ObjectCardFromJson(json);
}
