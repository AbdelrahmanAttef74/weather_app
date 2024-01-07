import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => MaterialApp(
          theme: ThemeData(
            primarySwatch: getWeatherColor(
                BlocProvider.of<GetWeatherCubit>(context)
                    .weatherModel
                    ?.weatherCondition),
          ),
          debugShowCheckedModeBanner: false,
          home: const HomeView(),
        ),
      ),
    );
  }
}

MaterialColor getWeatherColor(String? condition) {
  if (condition == null) {
    return Colors.yellow;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case 'Partly cloudy':
    case 'Patchy rain possible':
    case 'Patchy light drizzle':
    case 'Light drizzle':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
    case 'Light snow':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
    case 'Patchy light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Light rain shower':
    case 'Heavy snow':
      return Colors.lightBlue;

    case 'Cloudy':
    case 'Overcast':
    case 'Mist':
    case 'Patchy freezing drizzle possible':
    case 'Patchy snow possible':
    case 'Patchy sleet possible':
    case 'Freezing fog':
    case 'Fog':
    case 'Ice pellets':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
    case 'Light sleet':
      return Colors.grey;
    case 'Moderate or heavy sleet':
    case 'Thundery outbreaks possible':
    case 'Blowing snow':
    case 'Blizzard':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy snow with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Patchy light snow with thunder':
      return Colors.deepPurple;

    default:
      return Colors.grey; // Default color for unknown conditions
  }
}
