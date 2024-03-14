/*
2- 
second thing you need to create your cubit and make it extends cubit build in
from flutter_bloc backage 
then you need to make your function 'methode' to write logic in it;
 */
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  //first state in our app is no weatherState'initialState'
  GetWeatherCubit() : super(WeatherLoading());
  WeatherModel? weatherModel;

  getWeather({required String cityName}) async {
    try {
      emit(WeatherLoading());
      weatherModel =
          await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherSuccess(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherFailure());
    }
  }
}
