import 'package:geolocator/geolocator.dart';

class CoordinatesModel {
  final double latitude;
  final double longitude;

  CoordinatesModel({
    required this.latitude,
    required this.longitude,
  });

  factory CoordinatesModel.fromGeolocator(Position position) {
    return CoordinatesModel(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }
}
