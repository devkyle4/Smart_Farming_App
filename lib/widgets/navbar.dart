import 'package:final_year_project/widgets/predict_weed/upload_weed.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/login/loginpage.dart';

class NavBar extends StatelessWidget {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Evans'),
            accountEmail: const Text('balenciaga@hitati.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                  child: Image.network(
                'https://img.freepik.com/premium-vector/phoenix-logo-concept_173356-106.jpg?w=996',
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              )),
            ),
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg',
              ),
              fit: BoxFit.cover,
            )),
          ),
          ListTile(
            leading: const Icon(Icons.analytics),
            title: const Text('View Farm Analytics',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 46, 67, 103))),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.camera),
            title: const Text(
              'Detect Weeds',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 46, 67, 103)),
            ),
            onTap: () =>Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  UploadWeed()),
    ),
          ),
          const Divider(thickness: 1,),
          ListTile(
            leading: const Icon(Icons.analytics),
            title: const Text('Notification',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 46, 67, 103))),
            onTap: () => {},
            trailing: ClipOval(
                child: Container(
              color: Colors.red,
              width: 20,
              height: 20,
              child: const Center(
                  child: Text(
                '2',
                style: TextStyle(color: Colors.white, fontSize: 12),
              )),
            )),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 46, 67, 103))),
            onTap: () => {},
          ),
          const Divider(thickness: 1),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Exit',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 46, 67, 103))),
            onTap: () =>  {signOut(context)},
          ),
        ],
      ),
    );
  }

  signOut(context) async{
    await _auth.signOut();
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context)=> LoginPage()));
  }
}
