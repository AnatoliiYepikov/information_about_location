import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:information_about_location/logic/map_widget/animated_loading_widget.dart';
import 'package:latlong2/latlong.dart';
import 'package:information_about_location/data/map/map_service.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late final MapController mapController;
  LatLng coordinates = LatLng(42.7629600, 11.1094100);
  Future<LatLng> coordinates1 = fetchMapCoordinates();

  @override
  void initState() {
    mapController = MapController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LatLng>(
        future: coordinates1,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            coordinates =
                LatLng(snapshot.data!.latitude, snapshot.data!.longitude);

            return FlutterMap(
              mapController: mapController,
              options: MapOptions(
                onTap: (tapPosition, point) {
                  mapController.move(point, mapController.zoom);
                  snapshot.data!.latitude = point.latitude;
                  snapshot.data!.longitude = point.longitude;
                  setState(() {});
                },
                center: coordinates,
                zoom: 7,
                maxZoom: 18.0,
              ),
              nonRotatedChildren: [
                AttributionWidget.defaultWidget(
                  source: 'OpenStreetMap contributors',
                  onSourceTapped: null,
                ),
              ],
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: coordinates,
                      builder: (context) => const Icon(
                        Icons.pin_drop,
                        color: Colors.green,
                        size: 30.0,
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const AnimatedLoadingWidget();
        });
  }
}
