import 'package:final_year_project/model/weather_service/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../model/weather_service/weather_api_client.dart';

class AppDashboardScreen extends StatefulWidget {
  const AppDashboardScreen({Key? key}) : super(key: key);

  @override
  State<AppDashboardScreen> createState() => _AppDashboardScreenState();
}

class _AppDashboardScreenState extends State<AppDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          WeatherCard(),
          Expanded(
            child: GridView(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 5),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12),
              children: [
                TemperatureGridCards(
                  data: {
                    "title": "TEMPERATURE",
                    "subtitle": "25",
                    "icon": FontAwesomeIcons.temperatureHalf
                  },
                ),
                TemperatureGridCards(
                  data: {
                    "title": "DEW RATE",
                    "subtitle": "25",
                    "icon": FontAwesomeIcons.temperatureHalf
                  },
                ),
                PercentageGridCards(
                  data: {
                    "title": "HUMIDITY",
                    "percent": 0.4,
                    "icon": FontAwesomeIcons.rainbow
                  },
                ),
                PercentageGridCards(
                  data: {
                    "title": "SOIL MOISTURE",
                    "percent":1.0,
                    "icon": FontAwesomeIcons.water
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TemperatureGridCards extends StatelessWidget {
  const TemperatureGridCards({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 2, spreadRadius: 2, color: Colors.black12)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 5,
          ),
          Icon(
            data["icon"],
            size: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${data["subtitle"]} °C',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black45),
            ),
          ),
          Text(
            '${data["title"]}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}

class PercentageGridCards extends StatelessWidget {
  const PercentageGridCards({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    Color indicatorColor = Colors.green;
    int percentage = int.parse((data["percent"] * 100).toString().split(".")[0]);
    if (data["percent"] <= 0.3) {
      indicatorColor = Colors.red;
    } else if (data["percent"] <= 0.6) {
      indicatorColor = Colors.orange;
    }
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 2, spreadRadius: 2, color: Colors.black12)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 5,
          ),
          Icon(
            data["icon"],
            size: 40,
          ),
          Center(
            child: FractionallySizedBox(
              widthFactor: 0.95,
              child: Container(
                height: 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black26),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: FractionallySizedBox(
                    widthFactor: data["percent"],
                    child: Container(
                      height: 8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: indicatorColor),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: FractionallySizedBox(
              widthFactor: 0.95,
              child: Row(
                children: [
                  Flexible(
                    child: FractionallySizedBox(
                      widthFactor: data["percent"],
                     
                    ),
                  ),
                  Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: indicatorColor),
                  child: Text(
                    '${percentage} %',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  ),
                )
                ],
              ),
            ),
          ),
          Text(
            '${data["title"]}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 2, spreadRadius: 2, color: Colors.black12)
            ]),
        child: FutureBuilder(
            future: WeatherApiClient().getCurrentWeather("kumasi"),
            builder:
                (BuildContext context, AsyncSnapshot<Weather> snapshot) {
              if (snapshot.hasData) {
                return Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:15.0,top: 5),
                          child: Text(snapshot.data!.cityName,style: TextStyle(fontWeight: FontWeight.bold),),
                        ),  
                          
                      
                        Padding(
                          padding: EdgeInsets.only(left:15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: NetworkImage('http://openweathermap.org/img/w/${snapshot.data!.icon}.png'))
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  "${snapshot.data!.temp} °C",
                                  style: TextStyle(fontSize: 24),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:15.0),
                          child: Text("${snapshot.data!.mainWeather}, ${snapshot.data!.description}"),
                        )
                      ],
                    ),
                    Expanded(
                      child: Container(
                           height: MediaQuery.of(context).size.height * 0.2,
                         width: 150,
                        decoration: BoxDecoration(
                                      image: DecorationImage(image: NetworkImage('http://openweathermap.org/img/w/${snapshot.data!.icon}.png'),fit: BoxFit.cover),
                    
                        ),
                      ),
                    )
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(child: Text("Something went wrong"));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
