import 'package:final_year_project/widgets/sensors/humid.dart';
import 'package:final_year_project/widgets/sensors/moist.dart';
import 'package:final_year_project/widgets/sensors/ph.dart';
import 'package:final_year_project/widgets/sensors/temp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Sensors extends StatefulWidget {
  const Sensors({Key? key}) : super(key: key);

  @override
  State<Sensors> createState() => _SensorsState();
}

class _SensorsState extends State<Sensors> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Temperature(),
              Humidity(),
            ],
          ),
          //VERTICAL SPACE BETWEEN THE BOXES
          const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Moisture(),
              PhLevel(),
            ],
          ),
        ],
      ),
    );
  }
}
