import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
          builder: (context, state) {
        if (state is WeatherLoaded) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherSccess) {
          return WeatherInfoBody(
            weather: state.weatherModel,
          );
        } else if (state is WeatherFailure) {
          return const Center(
            child: Text('oops there was as error please try again later'),
          );
        } else {
          return const NoWeatherBody();
        }
      }),
    );
  }
}
