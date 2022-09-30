import 'package:final_year_project/widgets/dashboard/user_dashboard_screen.dart';
import 'package:final_year_project/widgets/dashboard/user_settings_screen.dart';
import 'package:flutter/material.dart';
import '../predict_weed/upload_weed.dart';
import 'news_feed_screen.dart';

class AppNavigationScreen extends StatefulWidget {
  const AppNavigationScreen({Key? key}) : super(key: key);

  @override
  State<AppNavigationScreen> createState() => _AppNavigationScreenState();
}

class _AppNavigationScreenState extends State<AppNavigationScreen> {
  int selectedIndex = 0;
  final titles = ["Dashboard", "News Feed", "Upload & Detect", "Settings"];

  final pages = [
    AppDashboardScreen(),
    NewsFeedScreen(),
    UploadWeed(),
    UserSettingsScreen()
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[selectedIndex]),
        automaticallyImplyLeading: true,
      ),
      body: pages.elementAt(selectedIndex),
      bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: (newIndex) {
            setState(() {
              selectedIndex = newIndex;
            });
          },
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "Dashboard"),
            NavigationDestination(icon: Icon(Icons.newspaper), label: "News"),
            NavigationDestination(icon: Icon(Icons.camera), label: "Detect"),
            NavigationDestination(
                icon: Icon(Icons.settings), label: "Settings"),
          ]),
    );
  }
}
