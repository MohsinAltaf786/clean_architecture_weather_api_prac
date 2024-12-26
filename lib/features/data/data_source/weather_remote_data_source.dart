import 'dart:developer';

import 'package:clean_artchitecture_weather_api_prac/core/error/exception.dart';
import 'package:clean_artchitecture_weather_api_prac/features/data/model/weather_model.dart';
import 'package:dio/dio.dart';

abstract interface class WeatherRemoteDataSource{
Future<WeatherModel>getWeatherData({required String api});
}
class WeatherRemoteDataSourceImp implements WeatherRemoteDataSource{
  @override
  Future<WeatherModel>getWeatherData({required String api})async{
    try{
      final response= await Dio().get(api);
      if(response.statusCode==200){
        WeatherModel weatherModel=WeatherModel.fromJson(response.data);
        return weatherModel;
      }
      else{
        throw Exception('user is null');
      }
    }on ServerException catch(e){
      log('an error occured ${e.message}');
    }catch (e){
      log('an error occured ${e.toString()}');
    }
    throw UnimplementedError();

  }
}