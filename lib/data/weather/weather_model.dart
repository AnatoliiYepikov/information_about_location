class WeatherModel {
  final String temp;
  final String description;
  final String currently;
  final String humidity;
  final String windSpeed;

  WeatherModel({
    required this.temp,
    required this.description,
    required this.currently,
    required this.humidity,
    required this.windSpeed,
  });

  factory WeatherModel.fromJson(Map<dynamic, dynamic> json) {
    return WeatherModel(
      temp: json['main']['temp'].toString(),
      description: json['weather'][0]['description'].toString(),
      currently: (json['main']['temp'] - 273.15).toInt().toString(),
      humidity: json['main']['humidity'].toString(),
      windSpeed: json['wind']['speed'].toString(),
    );
  }
}
