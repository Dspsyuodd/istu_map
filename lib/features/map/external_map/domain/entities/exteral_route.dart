import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

class ExternalRoute extends Equatable {
  final DateTime totalTime;
  
  final List<LatLng> points;

  const ExternalRoute({required this.totalTime, required this.points});

  @override
  List<Object?> get props => [totalTime, points];
}
