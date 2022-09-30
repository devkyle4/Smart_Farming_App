class Weather {
  final String cityName;
  final String temp;
  final String humidity;
  final String description;
  final String mainWeather;
  final String icon;

  Weather(
      {required this.cityName,
      required this.humidity,
      required this.temp,
      required this.mainWeather,
      required this.description,
      required this.icon,
      });

  factory Weather.fromJSON(Map<String, dynamic> json) {
    return Weather(
        cityName: json['name'],
        temp: json['main']['temp'],
        humidity: json['main']['humidity'],
        description: json['weather']['description'].toString(),
        mainWeather: json['weather']['main'].toString(),
         icon: json['weather']['icon'].toString()
        );
  }
}
