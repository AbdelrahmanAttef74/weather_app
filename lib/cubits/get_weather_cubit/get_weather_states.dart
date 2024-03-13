/*
1-
first thing in cubit pattern is to create states in your app;
then you need to create parent class to inherit to your children
*/
import 'package:weather_app/models/weather_model.dart';

abstract class WeatherStates {}

class WeatherIntial extends WeatherStates {}

class WeatherLoaded extends WeatherStates {}

class WeatherSccess extends WeatherStates {
  final WeatherModel weatherModel;

  WeatherSccess({required this.weatherModel});
}

class WeatherFailure extends WeatherStates {}
