import 'package:clean_artchitecture_weather_api_prac/features/domain/entity/weather.dart';
import 'package:clean_artchitecture_weather_api_prac/features/domain/usecases/weather_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherDataImpl _weatherDataImpl;
  WeatherBloc({required WeatherDataImpl weatherDataImpl}) :_weatherDataImpl=weatherDataImpl, super(WeatherInitial()){
    on<WeatherGetData>((event, emit) async {
      // TODO: implement event handler
      emit(WeatherLoading());
      // TODO: implement event handler
      final response=await _weatherDataImpl(WeatherParms(event.api));
      response.fold((failure){
        emit(WeatherFailure(failure.message));
      },(onSuccess){
        emit(WeatherSuccess(onSuccess));});});}
}
