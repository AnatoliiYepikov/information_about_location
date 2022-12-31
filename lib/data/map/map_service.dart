import 'package:latlong2/latlong.dart';
import 'package:information_about_location/data/coordinates/coordinates_service.dart';
import 'package:information_about_location/data/coordinates/coordinates_model.dart';

Future<LatLng> fetchMapCoordinates() async {
  CoordinatesModel coordinates = await determinePosition();
  return LatLng(coordinates.latitude, coordinates.longitude);
}
