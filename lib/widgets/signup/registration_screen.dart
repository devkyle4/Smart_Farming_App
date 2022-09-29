import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project/widgets/dashboard/dashboard.dart';
import 'package:final_year_project/widgets/login/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../utilities//colors/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../model/user_model.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // string for displaying the error Message
  String? errorMessage;

  //firebase initialization
  final _auth = FirebaseAuth.instance;

  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final firstNameEditingController = TextEditingController();
  final secondNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //first name field
    final firstNameField = Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 14, right: 14, top: 4),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE9E9E9)),
      ),
      child: TextFormField(
          autofocus: false,
          controller: firstNameEditingController,
          keyboardType: TextInputType.name,
          validator: (value) {
            RegExp regex = RegExp(r'^.{3,}$');
            if (value!.isEmpty) {
              return ("First Name cannot be Empty");
            }
            if (!regex.hasMatch(value)) {
              return ("Enter Valid name(Min. 3 Character)");
            }
            return null;
          },
          onSaved: (value) {
            firstNameEditingController.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.account_circle),
              hintText: "First Name",
              border: InputBorder.none,
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w500, color: Color(0xFF9D9D9D)))),
    );

    //second name field
    final secondNameField = Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 14, right: 14, top: 4),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE9E9E9)),
      ),
      child: TextFormField(
          autofocus: false,
          controller: secondNameEditingController,
          keyboardType: TextInputType.name,
          validator: (value) {
            if (value!.isEmpty) {
              return ("Second Name cannot be Empty");
            }
            return null;
          },
          onSaved: (value) {
            secondNameEditingController.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.account_circle),
            hintText: "Second Name",
            border: InputBorder.none,
            hintStyle: TextStyle(
                fontWeight: FontWeight.w500, color: Color(0xFF9D9D9D)),
          )),
    );

    //email field
    final emailField = Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 14, right: 14, top: 4),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE9E9E9)),
      ),
      child: TextFormField(
          autofocus: false,
          controller: emailEditingController,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty) {
              return ("Please Enter Your Email");
            }
            // reg expression for email validation
            if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                .hasMatch(value)) {
              return ("Please Enter a valid email");
            }
            return null;
          },
          onSaved: (value) {
            firstNameEditingController.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.mail),
              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "Email",
              border: InputBorder.none,
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w500, color: Color(0xFF9D9D9D)))),
    );

    //password field
    final passwordField = Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 14, right: 14, top: 4),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE9E9E9)),
      ),
      child: TextFormField(
          autofocus: false,
          controller: passwordEditingController,
          obscureText: true,
          validator: (value) {
            RegExp regex = RegExp(r'^.{6,}$');
            if (value!.isEmpty) {
              return ("Password is required for login");
            }
            if (!regex.hasMatch(value)) {
              return ("Enter Valid Password(Min. 6 Character)");
            }
            return null;
          },
          onSaved: (value) {
            firstNameEditingController.text = value!;
          },
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.vpn_key),
              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "Password",
              border: InputBorder.none,
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w500, color: Color(0xFF9D9D9D)))),
    );

    //confirm password field
    final confirmPasswordField = Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 14, right: 14, top: 4),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE9E9E9)),
      ),
      child: TextFormField(
          autofocus: false,
          controller: confirmPasswordEditingController,
          obscureText: true,
          validator: (value) {
            if (confirmPasswordEditingController.text !=
                passwordEditingController.text) {
              return "Password don't match";
            }
            return null;
          },
          onSaved: (value) {
            confirmPasswordEditingController.text = value!;
          },
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.vpn_key),
              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "Confirm Password",
              border: InputBorder.none,
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w500, color: Color(0xFF9D9D9D)))),
    );

    //signup button
    final signUpButton = SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
          onPressed: () {
            signUp(emailEditingController.text, passwordEditingController.text);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade500,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          child: const Text(
            "SignUp",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    const Text('Register Account',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            height: 1.5)),
                    const Text(
                        'Complete your details or continue \nwith social media',
                        textAlign: TextAlign.center),
                    const SizedBox(height: 45),
                    firstNameField,
                    const SizedBox(height: 10),
                    secondNameField,
                    const SizedBox(height: 10),
                    emailField,
                    const SizedBox(height: 10),
                    passwordField,
                    const SizedBox(height: 10),
                    confirmPasswordField,
                    const SizedBox(height: 10),
                    const Text(
                        'By continuing you confirm that you agree \nwith our Terms and Conditions',
                        textAlign: TextAlign.center),
                    const SizedBox(height: 5),
                    signUpButton,
                    Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(top: 4),
                        alignment: Alignment.center,
                        child: TextButton(
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                    builder: (context) => LoginPage())),
                            style: TextButton.styleFrom(
                              foregroundColor: const Color(0xFF9D9D9D),
                            ),
                            child:
                                const Text('Already have an account? Login..')))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => postDetailsToFirestore())
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
          print('there is an error');
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
      }
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sending these values
    print('pressed');
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondNameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(
            builder: (context) => const Dashboard(
                  title: 'My Dashboard',
                )),
        (route) => false);
  }
}
