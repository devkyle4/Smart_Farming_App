import 'package:flutter/material.dart';

import '../../colors/constants.dart';

class Moisture extends StatefulWidget {
  const Moisture({Key? key}) : super(key: key);

  @override
  State<Moisture> createState() => _MoistureState();
}

class _MoistureState extends State<Moisture> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      width: 150.0,
      child: Container(
          decoration: BoxDecoration(
            //border: Border.all(),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12, blurRadius: 8, offset: Offset(3, 3)),
              BoxShadow(
                  color: Color.fromARGB(150, 255, 255, 255),
                  blurRadius: 0,
                  offset: Offset(-3, -3)),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.water,
                color: kDarkGreyColor,
              ),
              Text('23%'),
              Text(
                'SOIL MOISTURE',
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
