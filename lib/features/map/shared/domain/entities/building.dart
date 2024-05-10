import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

class Building extends Equatable {
  final String id;
  final String title;
  final String address;
  final LatLng position;
  final String desctiption;

  const Building(
      {required this.id,
      required this.title,
      required this.address,
      required this.position,
      required this.desctiption});

  @override
  List<Object?> get props => [id, title, address, position, desctiption];
}
