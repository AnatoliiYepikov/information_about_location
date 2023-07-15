class CityModel {
  final String city;
  final String country;

  CityModel({
    required this.city,
    required this.country,
  });

  factory CityModel.fromJson(List<dynamic> json) {
    if (json.isEmpty) {
      return CityModel(
        city: 'The country and city could not be identified.',
        country: '',
      );
    } else {
      return CityModel(
        city: json[0]['name'].toString(),
        country: json[0]['country'].toString(),
      );
    }
  }
}
