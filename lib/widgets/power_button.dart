import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../utilities/colors/constants.dart';

class PowerButton extends StatefulWidget {
  const PowerButton({Key? key}) : super(key: key);

  @override
  State<PowerButton> createState() => _PowerButtonState();
}

class _PowerButtonState extends State<PowerButton> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: FlutterSwitch(
        width: 125.0,
        height: 55.0,
        valueFontSize: 25.0,
        toggleSize: 45.0,
        value: status,
        activeToggleColor: Colors.white,
        inactiveToggleColor: Colors.red,
        borderRadius: 30.0,
        activeColor: kGreenColor,
        inactiveColor: Colors.white,
        padding: 8.0,
        showOnOff: true,
        onToggle: (val) {
          setState(() {
            status = val;
          });
        },
      ),
    );
  }
}
//  LiteRollingSwitch(
//         //initial value
//         value: true,
//         textOn: 'disponible',
//         textOff: 'ocupado',
//         colorOn: Colors.greenAccent[700],
//         colorOff: Colors.redAccent[700],
//         iconOn: Icons.done,
//         iconOff: Icons.remove_circle_outline,
//         textSize: 16.0,
//         onChanged: (bool state) {
//           //Use it to manage the different states
//           //print('Current State of SWITCH IS: $state');
//         },
//       ),