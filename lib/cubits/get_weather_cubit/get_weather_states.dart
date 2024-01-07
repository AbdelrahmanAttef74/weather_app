/*
1-
first thing in cubit pattern is to create states in your app;
then you need to create parent class to inherit to your children
*/
import 'package:weather_app/models/weather_model.dart';

class WeatherStates {}

class WeatherIntialState extends WeatherStates {}

class WeatherLoadedState extends WeatherStates {
  final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailedState extends WeatherStates {}
