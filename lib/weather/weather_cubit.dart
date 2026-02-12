import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import '../model/weather_repo.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  final Dio _dio = Dio();

  Future<List<WeatherRepo>> getForecastWeather(
      int days,
      String city,
      ) async {
    try {
      emit(WeatherLoading());

      final response = await _dio.get(
        "https://api.weatherapi.com/v1/forecast.json",
        queryParameters: {
          "key": "f8785a5683efbef87bfcc47e8d719bed",
          "q": city,
          "days": days,
          "aqi": "no",
          "alerts": "no",
        },
      );

      final Map<String, dynamic> json = response.data;
      final List forecastDays = json["forecast"]["forecastday"];

      List<WeatherRepo> weathers = forecastDays
          .asMap()
          .entries
          .map((entry) => WeatherRepo.fromJson(json, entry.key))
          .toList();

      String bgImage = await getBGImage(
        city: weathers[0].location.name,
        country: weathers[0].location.country,
      );

      emit(WeatherSuccess(weather: weathers, bgIMage: bgImage));
      return weathers;
    } on DioException catch (e) {
      log(e.toString());
      emit(WeatherError(message: e.toString()));
      return [];
    }
  }

  Future<dynamic> getBGImage({
    required String city,
    required String country,
  }) async {
    final response = await Dio().get(
      "https://api.pexels.com/v1/search?query=$city city "
          "$country&per_page=1",
      options: Options(
        headers: {
          'Authorization':
          'VgJOfIHubBbHoDML78sfh9S4x8ta7uliEPLws6smUss8QsuILyVaOfdP',
        },
      ),
    );
    final Map<String, dynamic> json = response.data;
    return json["photos"][0]["src"]["original"];
  }
}
