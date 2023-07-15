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
    //futureCityModel = fetchCityModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CityModel>(
        future: fetchCityModel(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.country == '') {
              return Text('The country and city could not be identified.',
                  style: TextStyle(fontSize: 22), textAlign: TextAlign.center);
            } else {
              return Text(
                  'Country: ${snapshot.data!.country}     City: ${snapshot.data!.city}',
                  style: const TextStyle(fontSize: 22),
                  textAlign: TextAlign.center);
            }
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const CircularProgressIndicator();
        });
  }
}
