import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

class LatLngJsonConverter extends JsonConverter<LatLng, Map<String, dynamic>> {
  const LatLngJsonConverter();
  @override
  LatLng fromJson(Map<String, dynamic> json) => LatLng(
      (json['Latitude'] as num).toDouble(),
      (json['Longitude'] as num).toDouble());

  @override
  Map<String, dynamic> toJson(LatLng object) => {
        'Latitude': object.latitude,
        'Longitude': object.longitude,
      };
}
