import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:information_about_location/data/coordinates/coordinates_model.dart';
import 'package:information_about_location/data/coordinates/coordinates_service.dart';
import 'package:information_about_location/logic/city_widget/city_widget.dart';
import 'package:information_about_location/logic/map_widget/animated_loading_widget.dart';
import 'package:information_about_location/logic/solar_day_widget/solar_day_widget.dart';
import 'package:information_about_location/logic/weather_widget/weather_widget.dart';
import 'package:latlong2/latlong.dart';
//import 'package:information_about_location/data/map/map_service.dart';
import 'package:information_about_location/presentation/home.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  void initState() {
    mapController = MapController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            constraints: const BoxConstraints(minWidth: double.infinity),
            color: const Color.fromARGB(255, 210, 216, 224),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CityWidget(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    WeatherWidget(),
                    SolarDayWidget(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 65,
                      onPressed: () async {
                        coordinates = await determinePosition()
                            .then((CoordinatesModel position) {
                          return LatLng(position.latitude, position.longitude);
                        });

                        mapController.move(coordinates, mapController.zoom);

                        setState(() {});
                      },
                      icon: Image.asset(
                        'assets/icons/earth_arrow.png',
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Take the current position.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          'Latitude: ${double.parse(coordinates.latitude.toStringAsFixed(7))}',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          'Longitude: ${double.parse(coordinates.longitude.toStringAsFixed(7))}',
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: FutureBuilder<LatLng>(
              future: coordinates1,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                      onTap: (tapPosition, point) {
                        mapController.move(point, mapController.zoom);
                        snapshot.data!.latitude = point.latitude;
                        snapshot.data!.longitude = point.longitude;
                        coordinates = LatLng(point.latitude, point.longitude);
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
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
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
              }),
        ),
      ],
    );
  }
}
