import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/screens/splash_scrren.dart';
import 'package:weather_app/views/weather_view.dart';
import 'package:weather_app/weather/weather_cubit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [BlocProvider(create: (context) => WeatherCubit())],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
            routes: {
              '/search': (context) => const SearchView(),
              '/weather': (context) => const Weatherview(),
            },
          ),
        );
      },
    );
  }
}
