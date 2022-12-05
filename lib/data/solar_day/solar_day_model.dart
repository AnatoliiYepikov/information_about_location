class SolarDayModel {
  final String sunrise;
  final String sunset;
  final String solarNoon;
  final String dayLength;

  SolarDayModel({
    required this.sunrise,
    required this.sunset,
    required this.solarNoon,
    required this.dayLength,
  });

  factory SolarDayModel.fromJson(Map<dynamic, dynamic> json) {
    return SolarDayModel(
      sunrise: json['results']['sunrise'],
      sunset: json['results']['sunset'],
      solarNoon: json['results']['solar_noon'],
      dayLength: json['results']['day_length'],
    );
  }
}
