import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../login/loginpage.dart';

class UserSettingsScreen extends StatefulWidget {
  const UserSettingsScreen({Key? key}) : super(key: key);

  @override
  State<UserSettingsScreen> createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 7,
        ),
        Center(
          child: Stack(clipBehavior: Clip.none, children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/images/signin.jpg"),
                      fit: BoxFit.cover)),
            ),
            Container(
              width: 122,
              height: 122,
              color: Colors.transparent,
            ),
            Positioned(
                bottom: 0,
                right: -5,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.photo,
                    size: 35,
                  ),
                  color: Colors.black,
                ))
          ]),
        ),
        SizedBox(
          height: 7,
        ),
        Center(
            child: Text(
          "Evans",
          textAlign: TextAlign.center,
        )),
        Center(child: Text("evanvs@gmail.com", textAlign: TextAlign.center)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Account",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.edit),
          title: Text("Edit profile"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.phone),
          title: Text("Change Phone"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Security",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          onTap: () {},
          leading: Icon(Icons.lock),
          title: Text("Change password"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        Center(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(),
                onPressed: () => {signOut(context)},
                child: Text("Logout")),
          ),
        )
      ]),
    );
  }

  signOut(context) async {
    await _auth.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
