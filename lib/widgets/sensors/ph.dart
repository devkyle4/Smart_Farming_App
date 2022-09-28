import 'package:flutter/material.dart';

class PhLevel extends StatefulWidget {
  const PhLevel({Key? key}) : super(key: key);

  @override
  State<PhLevel> createState() => _PhLevelState();
}

class _PhLevelState extends State<PhLevel> {
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
          child: const Center(child: Text('pH: 7'))),
    );
  }
}
