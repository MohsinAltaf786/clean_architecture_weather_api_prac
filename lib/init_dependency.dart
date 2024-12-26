
import 'package:clean_artchitecture_weather_api_prac/features/data/data_source/weather_remote_data_source.dart';
import 'package:clean_artchitecture_weather_api_prac/features/data/repositories/weather_data_repository_imp.dart';
import 'package:clean_artchitecture_weather_api_prac/features/domain/repository/weather_data_repository.dart';
import 'package:clean_artchitecture_weather_api_prac/features/domain/usecases/weather_data.dart';
import 'package:clean_artchitecture_weather_api_prac/features/presentation/bloc/weather_bloc.dart';
import 'package:get_it/get_it.dart';

///for dependency Injection
final serviceLocater = GetIt.instance;

Future<void> initDependencies() async {
  _initAut();
}
void _initAut(){
  /// for dependency injection
serviceLocater.registerFactory<WeatherRemoteDataSource>(()=>WeatherRemoteDataSourceImp());
serviceLocater.registerFactory<WeatherDataRepository>(()=>WeatherDataRepositoryImp(weatherRemoteDataSource: serviceLocater()));
serviceLocater.registerFactory(()=>WeatherDataImpl(serviceLocater()));
serviceLocater.registerLazySingleton(()=>WeatherBloc(weatherDataImpl:serviceLocater()));
}