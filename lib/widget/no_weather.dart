import 'package:flutter/material.dart';

class NoWeatherWedgit extends StatelessWidget {
  const NoWeatherWedgit({super.key});

  @override
  Widget build(BuildContext context) {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/rainyicon.gif"),
          Text(
            "No Weather Found",
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
    );
  }
}
