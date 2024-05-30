import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_object.freezed.dart';
part 'search_object.g.dart';

@freezed
class SearchObject with _$SearchObject {
  const factory SearchObject({
    required final String id,
    required final String title,
    required final int type,
  }) = _SearchObject;

  factory SearchObject.fromJson(Map<String, dynamic> json) =>
      _$SearchObjectFromJson(json);
}
