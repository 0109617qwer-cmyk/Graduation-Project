import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../model/weather_repo.dart';
class GetWeatherWedgit extends StatelessWidget {
  const GetWeatherWedgit({
    super.key,
    required this.weathers,
    required this.bgImage,
  });

  final List<WeatherRepo> weathers;
  final String bgImage;
  @override
  Widget build(BuildContext context) {
    final today = weathers[0];

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
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Image.network(
              "https:${today.weather.icon}",
              width: 250.w,
              height: 120.h,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stack) =>
              const Icon(
                Icons.error,
                color: Colors.red,
              ),
            ),
            Text(
              "${today.weather.averageTemp} °C",
              style: TextStyle(
                fontSize: 54.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              today.location.country,
              style: TextStyle(
                fontSize: 22.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              "Max: ${today.weather.maxtemp}°C   Min: ${today.weather.minTemp}°C",
              style: TextStyle(
                fontSize: 18.sp,
                color: const Color(0xffddb130),
                fontWeight: FontWeight.w500,
              ),
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),

                decoration: BoxDecoration(
                  image: DecorationImage(
                    //colorFilter: ColorFilter.srgbToLinearGamma(),
                    image: NetworkImage(bgImage),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(220, 28, 33, 70),
                      Color.fromARGB(220, 88, 36, 179),
                    ],
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "5 - Day Forecast",
                        style: TextStyle(
                          fontSize: 24.sp,
                          color: const Color.fromARGB(
                            255,
                            255,
                            255,
                            255,
                          ),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: weathers.length,
                          physics:
                          const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final day =
                                weathers[index].weather;
                            return ListTile(
                              leading: Image.network(
                                "https:${day.icon}",
                                width: 40.w,
                                height: 40.h,
                                errorBuilder:
                                    (
                                    context,
                                    error,
                                    stack,
                                    ) => Icon(
                                  Icons.wb_sunny,
                                  size: 24.w,
                                  color: Colors.amber,
                                ),
                              ),
                              title: Text(
                                index == 0
                                    ? "Today"
                                    : day.date,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                "${day.minTemp}° - ${day.maxtemp}°",
                                style: TextStyle(
                                  color: Colors.grey[300],
                                  fontSize: 16.sp,
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                              trailing: Text(
                                "${day.averageTemp}°C",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.amber,
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
