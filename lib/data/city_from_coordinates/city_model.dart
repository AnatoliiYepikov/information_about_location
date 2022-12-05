class CityModel {
  final String city;
  final String country;
  final String lat;
  final String lon;

  CityModel({
    required this.city,
    required this.country,
    required this.lat,
    required this.lon,
  });

  factory CityModel.fromJson(List<dynamic> json) {
    return CityModel(
      city: json[0]['name'].toString(),
      country: json[0]['country'].toString(),
      lat: json[0]['lat'].toString(),
      lon: json[0]['lon'].toString(),
    );
  }
}
