import 'package:flutter/material.dart';
import 'package:information_about_location/data/city_from_coordinates/city_model.dart';
import 'package:information_about_location/data/city_from_coordinates/city_service.dart';

class CityWidget extends StatefulWidget {
  const CityWidget({super.key});

  @override
  State<CityWidget> createState() => _CityWidgetState();
}

class _CityWidgetState extends State<CityWidget> {
  late Future<CityModel> futureCityModel;

  @override
  void initState() {
    futureCityModel = fetchCityModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CityModel>(
        future: futureCityModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              padding: const EdgeInsets.all(5),
              children: [
                Text(
                    'Country: ${snapshot.data!.country}     City: ${snapshot.data!.city}',
                    style: const TextStyle(fontSize: 22),
                    textAlign: TextAlign.center),
                Text(
                    style: const TextStyle(fontSize: 16),
                    'Latitude: ${snapshot.data!.latitude}     Longitude: ${snapshot.data!.longitude}'),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        });
  }
}
