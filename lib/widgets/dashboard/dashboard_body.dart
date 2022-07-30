import 'package:final_year_project/widgets/atmospheric_temp_time.dart';
import 'package:flutter/material.dart';
import 'package:final_year_project/widgets/sensors_page.dart';
import '../power_button.dart';
import '../weather/display_weather_widget.dart';

class DashboardBody extends StatefulWidget {
  const DashboardBody({Key? key}) : super(key: key);

  @override
  State<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        child: Column(
          children: const [
            DisplayWeather(),
            PowerButton(),
            //SECOND CONTAINER
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(1.0),
                child: Sensors(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
