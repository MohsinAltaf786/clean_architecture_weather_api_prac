
part of 'weather_bloc.dart';
@immutable
sealed class WeatherEvent {}
final class WeatherGetData extends WeatherEvent{
  final String api;
  WeatherGetData({required this.api});
}
