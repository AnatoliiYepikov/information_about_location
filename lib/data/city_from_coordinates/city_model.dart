class CityModel {
  final String city;
  final String country;
  final String latitude;
  final String longitude;

  CityModel({
    required this.city,
    required this.country,
    required this.latitude,
    required this.longitude,
  });

  factory CityModel.fromJson(List<dynamic> json) {
    return CityModel(
      city: json[0]['name'].toString(),
      country: json[0]['country'].toString(),
      latitude: json[0]['lat'].toString(),
      longitude: json[0]['lon'].toString(),
    );
  }
}
