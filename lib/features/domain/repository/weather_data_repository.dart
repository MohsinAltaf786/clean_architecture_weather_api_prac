import 'package:clean_artchitecture_weather_api_prac/core/error/failure.dart';
import 'package:clean_artchitecture_weather_api_prac/features/domain/entity/weather.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class WeatherDataRepository{

  Future <Either<Failure,Weather>>weatherData({
    required String api,
  });}