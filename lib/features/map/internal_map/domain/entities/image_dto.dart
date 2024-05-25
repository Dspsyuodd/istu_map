import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_dto.freezed.dart';
part 'image_dto.g.dart';

@Freezed()
class ImageDto with _$ImageDto {
  const factory ImageDto({
    required String id,
    required String objectId,
    required String title,
  }) = _ImageDto;

  factory ImageDto.fromJson(Map<String, dynamic> json) =>
      _$ImageDtoFromJson(json);
}

@Freezed()
class GetImagesResult with _$GetImagesResult {
  const factory GetImagesResult({
    required List<ImageDto> images,
  }) = _GetImagesResult;

  factory GetImagesResult.fromJson(Map<String, dynamic> json) =>
      _$GetImagesResultFromJson(json);
}