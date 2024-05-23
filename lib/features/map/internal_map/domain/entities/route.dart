import 'dart:ui';

import 'package:equatable/equatable.dart';

class Route extends Equatable {
  final List<Offset> points;

  const Route({required this.points});
  
  @override
  List<Object?> get props => [points];
}
