import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '654f2cbdd2414546993144159232004';
  final Dio dio;
  WeatherServices(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops there was an error,try later';
      throw (errorMessage);
    } catch (e) {
      log(e.toString());
      throw ('oops there was an error , try later');
    }
  }
}
