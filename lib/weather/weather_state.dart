part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {}
final class WeatherInitial extends WeatherState {}
final class WeatherLoading extends WeatherState {}
final class WeatherSuccess extends WeatherState {
  final List<WeatherRepo> weather;
  final String bgIMage;

  WeatherSuccess({
    required this.weather,
    required this.bgIMage,
  });

}
final class WeatherError extends WeatherState {
  final String message;
  WeatherError({required this.message});
}
