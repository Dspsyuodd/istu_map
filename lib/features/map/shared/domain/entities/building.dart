import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

class Building extends Equatable {
  final String id;
  final String title;
  final String address;
  final LatLng position;
  final String description;

  const Building(
      {required this.id,
      required this.title,
      required this.address,
      required this.position,
      required this.description});

  @override
  List<Object?> get props => [id, title, address, position, description];
}
