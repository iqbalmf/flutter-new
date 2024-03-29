import 'package:flutter/material.dart';
import 'package:flutter_app/screen/homemenu.dart';
import 'package:flutter_app/utils/validation';

class LoginPage extends StatefulWidget {
  static String tag = "login-page";
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> with Validation {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  final formKey = GlobalKey<FormState>();

  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(40.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 155.0,
                    child: Image.network(
                      "https://flutter.io/images/homepage/header-illustration.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 45.0,
                  ),
                  userNameField(),
                  SizedBox(
                    height: 25.0,
                  ),
                  passwordField(),
                  SizedBox(
                    height: 35.0,
                  ),
                  buttonLogin(),
                  SizedBox(
                    height: 15.0,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget userNameField() {
    return TextFormField(
        obscureText: false,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Username",
            labelText: "Input Username",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        validator: validateName,
        onSaved: (String value) {
          username = value;
        });
  }

  Widget passwordField() {
    return TextFormField(
        obscureText: true,
        keyboardType: TextInputType.numberWithOptions(),
        maxLength: 6,
        decoration: InputDecoration(
            labelText: "Input Password",
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Password",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        validator: validatePassword,
        onSaved: (String value) {
          password = value;
        });
  }

  Widget buttonLogin() {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();

            print("Username : $username");
            print("Password : $password");

            Navigator.of(context).pushNamed(HomePage.tag);
          }
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
