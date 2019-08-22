import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      home: Scaffold(
//        appBar: AppBar(
//          backgroundColor: Colors.green,
//          leading: Icon(Icons.home),
//          title: Text("New Tools Flutter"),
//        ),
//        body: Container(
//          margin: EdgeInsets.all(10.0),
//          child: Column(
//            children: <Widget>[
//              Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Icon(Icons.archive),
//                  Text(
//                    "New Article",
//                    style: new TextStyle(fontWeight: FontWeight.bold),
//                  )
//                ],
//              ),
//              Card(
//                child: Column(
//                  children: <Widget>[
//                    Image.network(
//                        'https://flutter.io/images/homepage/header-illustration.png'),
//                    Text("My First Flutter App")
//                  ],
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
      title: "New Tools Flutter",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: "Flutter Login"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final usernameField = TextField(
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Username",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.lightBlue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 155.0,
                      child: Image.network(
                        'https://flutter.io/images/homepage/header-illustration.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45.0),
                    usernameField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(height: 35.0),
                    loginButton,
                    SizedBox(height: 15.0),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
