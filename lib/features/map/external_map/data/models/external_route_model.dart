import 'package:json_annotation/json_annotation.dart';
import 'package:latlong2/latlong.dart';

import '../../domain/entities/exteral_route.dart';

part 'external_route_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class ExternalRouteModel extends ExternalRoute {
  const ExternalRouteModel({required super.totalTime, required super.points});

  factory ExternalRouteModel.fromJson(Map<String, dynamic> json) =>
      _$ExternalRouteModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExternalRouteModelToJson(this);
}
