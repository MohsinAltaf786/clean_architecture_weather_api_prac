import 'package:clean_artchitecture_weather_api_prac/core/error/failure.dart';
import 'package:clean_artchitecture_weather_api_prac/core/usecase/weather_usecase.dart';
import 'package:clean_artchitecture_weather_api_prac/features/domain/entity/weather.dart';
import 'package:clean_artchitecture_weather_api_prac/features/domain/repository/weather_data_repository.dart';
import 'package:fpdart/fpdart.dart';

class WeatherDataImpl implements UseCase<Weather,WeatherParms>{
  final WeatherDataRepository weatherDataRepository;
  WeatherDataImpl(this.weatherDataRepository);
  @override
  Future<Either<Failure,Weather>>call(WeatherParms api)async{
    return await weatherDataRepository.weatherData(api: api.api);
  }

}
class WeatherParms{
  final String api;

  WeatherParms(this.api);
}