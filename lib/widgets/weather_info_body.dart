import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/views/search_view.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weather});
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    weatherModel.image.contains('https:');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Weather App',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const SearchView();
                }));
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 32,
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'updated at ${weatherModel.date.hour} : ${weatherModel.date.minute}',
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  'https:${weatherModel.image}',
                ),
                Text(
                  weatherModel.temp.toInt().toString(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Text('Maxtemp : ${weatherModel.maxTemp.toInt()}'),
                    Text('Mintemp :${weatherModel.minTemp.toInt()}'),
                  ],
                )
              ],
            ),
            Text(
              weatherModel.weatherCondition,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
