import 'package:clean_artchitecture_weather_api_prac/core/utils/functions/convert_temp_to_celsius.dart';
import 'package:clean_artchitecture_weather_api_prac/features/domain/entity/weather.dart';
import 'package:flutter/material.dart';
class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key, required this.weather});
  final Weather weather;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Clear And Sunny Day',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            '${celsius(weather.main.temp).toInt().toString()}\u00B0',
            style: TextStyle(color: Colors.white, fontSize:40,fontWeight: FontWeight.w600),)
        ],
      ),
    );
  }
}
