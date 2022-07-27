import 'dart:convert';

import 'package:http/http.dart' as http;

class DataService {
  void getWeather(String city) async {
    final queryParameters = {'q': city, 'appid': 'f2a960bb70f2775880c89aca57d145dd', 'units': 'standard'};

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);
    print(response.body);

    final json = jsonDecode(response.body);
  }
}
