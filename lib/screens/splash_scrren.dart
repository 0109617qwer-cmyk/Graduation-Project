import 'package:flutter/material.dart';
// import 'package:weatherapp/ui/screens/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../views/weather_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
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
              children: [
            SizedBox(
            height: MediaQuery.of(context).size.height / 12),
                Image.asset("assets/images/weather.png"),
                Text(
                  "Weather",
                  style: TextStyle(
                    fontSize: 64.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "ForeCasts",
                  style: TextStyle(
                    fontSize: 64.sp,
                    color: Color(0xffddb130),
                  ),
                ),
                SizedBox(
                  height:
                  MediaQuery.of(context).size.height /
                      12,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Weatherview(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffddb130),
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 80.w,
                    ),
                  ),
                  child: Text(
                    "Get Start",
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
