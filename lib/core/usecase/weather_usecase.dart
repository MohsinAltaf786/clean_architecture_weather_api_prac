import 'package:clean_artchitecture_weather_api_prac/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<SuccessType,Parms>{
  Future<Either<Failure,SuccessType>> call(Parms parms);
}