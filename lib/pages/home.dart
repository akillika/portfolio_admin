import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:portfolioadmin/pages/login.dart';
import 'package:portfolioadmin/pages/signup.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/landingpage': (_) => HomePage(),
        '/signuppage': (_) => SignupPage(),
        'loginpage':(_)=>LoginPage(),
      },
      home: LoginPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.remove_circle_outline),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {}).catchError((e) {
                print(e);
              });
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('loginpage');
            },
          ),
        ],
        elevation: 0.0,
        title: Text('Portfolio Admin'),
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(child: null),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'receivedprojects');
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Received Projects',
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward),
                      onPressed: () {
                        Navigator.pushNamed(context, 'receivedprojects');
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Text(greetings() + ' Admin', style: TextStyle(fontSize: 25.0))
            ],
          ),
        ),
      ),
    );
  }

  String greetings() {
    var now;
    now = DateTime.now().hour;
    if (now < 12) {
      return 'Good morning,';
    } else if (now < 17) {
      return 'Good afternoon,';
    } else {
      return 'Good evening,';
    }
  }
}
