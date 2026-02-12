
import 'package:weather_app/model/weather_model.dart';
import 'location_model.dart';

class WeatherRepo {
  final LocationModel location;
  final WeatherModel weather;

  WeatherRepo({
    required this.location,
    required this.weather,
  });
  factory WeatherRepo.fromJson(
      Map<String, dynamic> json,
      int index,
      ) => WeatherRepo(
    location: LocationModel.fromJson(json),
    weather: WeatherModel.fromjson(json, index),
  );
}
