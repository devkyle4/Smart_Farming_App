import 'dart:math';
import 'package:final_year_project/model/weather_service/weather_api_client.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:intl/intl.dart';

// Display weather container
class DisplayWeather extends StatefulWidget {
  /// constructor
  const DisplayWeather({
    super.key,
  });

  @override
  State<DisplayWeather> createState() => _DisplayWeatherState();
}

class _DisplayWeatherState extends State<DisplayWeather> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;

  Future<void> getData() async {
    data = (await client.getCurrentWeather('Kumasi')) as Weather?;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: Row(children: []),
            );
          } else {
            return Container();
          }
        });
  }
}
