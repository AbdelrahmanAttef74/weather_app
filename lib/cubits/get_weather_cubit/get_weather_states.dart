/*
1-
first thing in cubit pattern is to create states in your app;
then you need to create parent class to inherit to your children
*/
import 'package:weather_app/models/weather_model.dart';

abstract class WeatherStates {}

class WeatherIntialState extends WeatherStates {}

class WeatherLoading extends WeatherStates {}

class WeatherSuccess extends WeatherStates {
  final WeatherModel weatherModel;
  WeatherSuccess({required this.weatherModel});
}

class WeatherFailure extends WeatherStates {}
