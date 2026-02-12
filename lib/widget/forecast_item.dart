import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForecastItem extends StatelessWidget {
  final String temp;
  final String image;
  final String precipitation;

  const ForecastItem({
    super.key,
    required this.temp,
    required this.image,
    required this.precipitation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        Text(
          temp,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Image.network(
          image,
          width: 70.w,
          height: 70.h,
          fit: BoxFit.contain,
        ),
        SizedBox(height: 5.h),
        Text(
          precipitation,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
