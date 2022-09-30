import 'package:flutter/material.dart';
import '../../utilities/colors/constants.dart';
import '../dashboard/app_navigation_screen.dart';
import 'loginpage_body.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => AppNavigationScreen()));
        },
        child: Text("Navigation menu"),
        ),
        appBar: AppBar(
        
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
