import 'dart:convert';
import 'package:http/http.dart' as http;
import './weather_model.dart';

class WeatherApiClient {
  Future<Weather> getCurrentWeather(String location) {
    var uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=f2a960bb70f2775880c89aca57d145dd&units=metric');

    return http.get(
      uri,
      headers: {"Content-Type": "application/json"},
    ).then((response) {
      Map<String, dynamic> json = jsonDecode(response.body);
      Weather weather = Weather(
          cityName: json['name'],
          humidity: json['main']['humidity'].toString(),
          temp: json['main']['temp'].toString(),
           description:json['weather'][0]['description'].toString(),
           mainWeather:json['weather'][0]['main'].toString(),
           icon:json['weather'][0]['icon'].toString()
          );
         

      return weather;
    });
  }
}
