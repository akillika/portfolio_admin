import 'package:flutter/material.dart';
import 'pages/receivedprojects.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'receivedprojects':(_)=>receivedprojects(),
      },
      home: HomePage(),
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
        elevation: 0.0,      
       title: Text('Portfolio Admin'),
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
        
        child: Column(
          children: <Widget>[
            DrawerHeader(child: null),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, 'receivedprojects');
              },
                          child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Received Projects',style: TextStyle(fontSize:18),),
                    IconButton(icon: Icon(Icons.arrow_forward), 
                    onPressed: (){ Navigator.pushNamed(context, 'receivedprojects');},
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),

      body: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Text(greetings() + ' Admin',style: TextStyle(fontSize:25.0))
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