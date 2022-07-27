import 'package:flutter/material.dart';

import '../../colors/constants.dart';

class Temperature extends StatefulWidget {
  const Temperature({Key? key}) : super(key: key);

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      width: 150.0,
      child: Container(
          decoration: BoxDecoration(
            //border: Border.all(),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12, blurRadius: 8, offset: Offset(3, 3)),
              BoxShadow(
                  color: Color.fromARGB(150, 255, 255, 255),
                  blurRadius: 0,
                  offset: Offset(-3, -3)),
            ],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.thermostat, color: kDarkGreyColor),
              Text(
                '23C',
              ),
              Text(
                'SOIL TEMPERATURE',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12.0,
                    color: kBlueColor),
              ),
            ],
          )),
    );
  }
}
