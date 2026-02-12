class WeatherModel {
  final num maxtemp;
  final num minTemp;
  final num averageTemp;
  final String text;
  final String icon;
  final String date;
  WeatherModel({
    required this.maxtemp,
    required this.minTemp,
    required this.averageTemp,
    required this.text,
    required this.icon,
    required this.date,
  });

  factory WeatherModel.fromjson(
      Map<String, dynamic> weatherData,
      int index,
      ) {
    final dayData =
    weatherData["forecast"]["forecastday"][index]["day"];

    return WeatherModel(
      date: weatherData["forecast"]["forecastday"][index]["date"],
      maxtemp: dayData["maxtemp_c"],
      minTemp: dayData["mintemp_c"],
      averageTemp: dayData["avgtemp_c"],
      text: dayData["condition"]['text'],
      icon: dayData["condition"]["icon"] ??
          'https://app.lottiefiles.com/animation/c5afac30-c7c2-4bf9-8fa3-2fec7b26b642',
    );
  }
}
