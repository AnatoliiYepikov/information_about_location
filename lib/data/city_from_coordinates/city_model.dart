class CityModel {
  final String city;
  final String country;

  CityModel({
    required this.city,
    required this.country,
  });

  factory CityModel.fromJson(List<dynamic> json) {
    return CityModel(
      city: json[0]['name'].toString(),
      country: json[0]['country'].toString(),
    );
  }
}
