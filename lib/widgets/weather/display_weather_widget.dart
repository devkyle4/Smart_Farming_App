import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:intl/intl.dart';

/// Display weather container
class DisplayWeather extends StatefulWidget {
  /// constructor
  const DisplayWeather({
    super.key,
  });

  /// Formats date into day,hour and minute eg: 1st August, 2021 7:00pm
  static String toDayHourMinute(String date) {
    final parsedDate = DateTime.parse(date);
    final hour = DateFormat.jm();
    final day = DateFormat.yMMMd();
    return '${day.format(parsedDate)}, ${hour.format(parsedDate)}';
  }

  @override
  State<DisplayWeather> createState() => _DisplayWeatherState();
}

class _DisplayWeatherState extends State<DisplayWeather> {
  ///Weather package key
  WeatherFactory wf = WeatherFactory('dc543b10740f46613f9426802f58f795');

  /// round double by decimal places
  double roundDouble(double value, int places) {
    final mod = pow(10.0, places);
    return (value * mod).round().toDouble() / mod;
  }

  Future<Weather?> getCurrentWeather() async {
    await Geolocator.requestPermission();
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    try {
      final w = await wf.currentWeatherByLocation(
          position.latitude, position.longitude);
      print(w);
      return w;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, AsyncSnapshot<Weather?> snapshot) {
          if (snapshot.hasData) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Padding(
                  //     padding: const EdgeInsets.symmetric(vertical: 12),
                  //     child: Text('Weather forecast',
                  //         style: Theme.of(context).textTheme.titleMedium)),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.all(20),
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 4),
                                      child: Text('Today',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.greenAccent,
                                              fontWeight: FontWeight.w500))),
                                  Text.rich(TextSpan(children: [
                                    TextSpan(
                                        text:
                                            '${roundDouble(snapshot.data?.temperature?.celsius ?? 0, 1)}°C ',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500)),
                                    TextSpan(
                                        text:
                                            '${roundDouble(snapshot.data?.tempMin?.celsius ?? 0, 1)}°C ',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black38))
                                  ]))
                                ]),
                            Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: Text(
                                          DisplayWeather.toDayHourMinute(
                                              snapshot.data!.date.toString()),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500))),
                                  Row(children: [
                                    Row(children: [
                                      const Icon(FontAwesomeIcons.droplet,
                                          size: 14, color: Colors.blueAccent),
                                      Text(' ${snapshot.data?.humidity}%',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500))
                                    ]),
                                    Row(children: [
                                      const Icon(Icons.speed,
                                          size: 20, color: Colors.blueAccent),
                                      Text(' ${snapshot.data?.windSpeed}m/s',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500))
                                    ])
                                  ])
                                ])
                          ]))
                ]);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
