import 'package:flutter/material.dart';
import 'package:weather_app/views/search_view.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'there is no weather 😔 start',
              style: TextStyle(fontSize: 28),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(fontSize: 28),
            )
          ],
        ),
      ),
    );
  }
}
