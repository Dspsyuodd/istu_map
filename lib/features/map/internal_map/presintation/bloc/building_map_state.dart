part of 'building_map_bloc.dart';

sealed class BuildingMapState extends Equatable {
  const BuildingMapState();
  
  @override
  List<Object> get props => [];
}

final class BuildingMapInitial extends BuildingMapState {}
