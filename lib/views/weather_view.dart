import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../screens/search_screen.dart';
import '../weather/weather_cubit.dart';
import '../widget/get_weather.dart';
import '../widget/no_weather.dart';

class Weatherview extends StatelessWidget {
  const Weatherview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SearchView(),
              ),
            );
          },
          icon: Icon(Icons.search, color: Colors.white),
        ),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 28, 33, 70),
                    Color.fromARGB(255, 88, 36, 179),
                    Color(0xFFE14DFF),
                  ],
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/rainyicon.gif",
                    ),
                    Text(
                      "Loading......",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(
                          255,
                          255,
                          255,
                          255,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is WeatherSuccess) {
            return GetWeatherWedgit(
              weathers: state.weather,
              bgImage: state.bgIMage,
            );
          } else {
            return NoWeatherWedgit();
          }
        },
      ),
    );
  }
}
