import 'package:istu_map/features/map/shared/domain/entities/building.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'building_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class BuildingModel extends Building {
  const BuildingModel(
      {required super.id,
      required super.title,
      required super.address,
      required super.position,
      required super.description});

  factory BuildingModel.fromJson(Map<String, dynamic> json) =>
      _$BuildingModelFromJson(json);

  Map<String, dynamic> toJson() => _$BuildingModelToJson(this);
}
