import 'package:clean_artchitecture_weather_api_prac/core/error/failure.dart';
import 'package:clean_artchitecture_weather_api_prac/features/data/data_source/weather_remote_data_source.dart';
import 'package:clean_artchitecture_weather_api_prac/features/domain/entity/weather.dart';
import 'package:clean_artchitecture_weather_api_prac/features/domain/repository/weather_data_repository.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/src/either.dart';

 class WeatherDataRepositoryImp implements WeatherDataRepository{
       final WeatherRemoteDataSource weatherRemoteDataSource;
       WeatherDataRepositoryImp({required this.weatherRemoteDataSource});

  @override
  Future<Either<Failure, Weather>> weatherData({required String api}) {
    // TODO: implement weatherData
    return  _getWeather(()async=> await weatherRemoteDataSource.getWeatherData(api: api));
  }
       Future <Either<Failure,Weather>>_getWeather(Future<Weather>Function()fn)async{
         try{
           final weather=await fn();
           return right(weather);
         }on DioException catch (e){
           return left(Failure(e.message??''));
         }catch (e){return left(Failure(e.toString()));}
       }

}