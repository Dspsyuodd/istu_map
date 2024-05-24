import 'package:freezed_annotation/freezed_annotation.dart';

part 'edge.freezed.dart';
part 'edge.g.dart';

@Freezed()
class Edge with _$Edge {
  const factory Edge({
    required String fromId,
    required String toId,
  }) = _Edge;

  factory Edge.fromJson(Map<String, dynamic> json) => _$EdgeFromJson(json);
}
