import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:istu_map/core/data/json_converters/date_time_json_converter.dart';
import '../../../../../core/data/json_converters/lat_lng_json_converter.dart';
import 'package:latlong2/latlong.dart';

part 'exteral_route.freezed.dart';
part 'exteral_route.g.dart';

@Freezed()
class ExternalRoute with _$ExternalRoute {
  const factory ExternalRoute({
    @DateTimeJsonConverter() required DateTime totalTime,
    @LatLngJsonConverter() required List<LatLng> points,
  }) = _ExternalRoute;

  factory ExternalRoute.fromJson(Map<String, dynamic> json) =>
      _$ExternalRouteFromJson(json);
}
