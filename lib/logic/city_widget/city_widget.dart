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
            return Column(
              children: [
                Text('Country: ${snapshot.data!.country}'),
                Text('City: ${snapshot.data!.city}'),
                Text('Latitude: ${snapshot.data!.lat}'),
                Text('Longitude: ${snapshot.data!.lon}'),
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
