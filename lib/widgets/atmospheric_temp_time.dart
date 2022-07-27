import 'package:flutter/material.dart';

class AtmosTempTime extends StatefulWidget {
  const AtmosTempTime({Key? key}) : super(key: key);

  @override
  State<AtmosTempTime> createState() => _AtmosTempTimeState();
}

class _AtmosTempTimeState extends State<AtmosTempTime> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(3, 3)),
                      BoxShadow(
                          color: Colors.white,
                          blurRadius: 0,
                          offset: Offset(-3, -3)),
                    ],
                    borderRadius: BorderRadius.circular(10.0)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: const [
                        Text(
                          'Atmospheric Temperature:',
                          style: TextStyle(
                              fontSize: 10.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Time',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
