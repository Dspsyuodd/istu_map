import 'package:latlong2/latlong.dart';

extension LatLngToDto on LatLng {
  Map<String, dynamic> toDto() {
    return {
      "StartPointDto": {
        'Latitude': latitude,
        'Longitude': longitude,
      },
    };
  }
}
