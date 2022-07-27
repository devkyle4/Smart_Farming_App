import 'package:flutter/material.dart';
import '../../colors/constants.dart';
import 'loginpage_body.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kGreenColor,
          title: const Text(
            'Swift Farm',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: LoginPageBody(),
        backgroundColor: kBgColor,
      ),
    );
  }
}
