import 'package:flutter/material.dart';
import '../utilities/colors/constants.dart';

class Button extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String label;
  final bool disabled;
  final VoidCallback onButtonTap;
  final double elevation;
  const Button(
      {Key? key,
      required this.label,
      this.backgroundColor = kGreenColor,
      this.textColor = Colors.white,
      required this.onButtonTap,
      this.disabled = false,
      this.elevation = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: elevation,
          minimumSize: const Size.fromHeight(60),
          primary: backgroundColor,
          // disabledForegroundColor:
          // const Color.fromRGBO(32, 32, 32, 1).withOpacity(0.38),
          // disabledBackgroundColor:
          // const Color.fromRGBO(32, 32, 32, 1).withOpacity(0.12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          )),
      onPressed: disabled ? null : onButtonTap,
      child: Text(label, style: TextStyle(color: textColor)),
    );
  }
}
