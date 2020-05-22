

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText:'Email'),
                onChanged: (value){
                  setState(() {
                    _email = value;
                  });
                },
              ),
              SizedBox(height:15.0),
              TextField(
                decoration: InputDecoration(hintText: 'Password'),
                onChanged: (value){
                  setState(() {
                    _password = value;
                  });
                },
                obscureText: true,
              ),
              SizedBox(height:20.0),
              RaisedButton(
                child: Text('Login'),
                color:Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: (){
                  signIn();
                },
              ),
              SizedBox(height:15.0),
              Text('Dont\'t have an account?'),
              SizedBox(height:10.0),
              RaisedButton(
                child: Text('Sign Up'),
                color:Colors.blue,
                textColor: Colors.white,
                elevation: 7.0,
                onPressed: (){
                  Navigator.of(context).pushNamed('/signuppage');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
   void signIn () async {
    try {FirebaseUser user;
    user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)).user;
    if(user!=null) {
      Navigator.of(context).pushReplacementNamed('/landingpage');
    } 
    }on PlatformException catch (e){
      switch(e.message) {
        case 'There is no user record corresponding to this identifier. The user may have been deleted.'
        : Scaffold.of(context).showSnackBar(
          SnackBar(content: Text('Check Yur Username and Password'),)
        );

      }
    }
  }
}