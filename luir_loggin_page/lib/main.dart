import 'package:flutter/material.dart';
import 'package:luirlogginpage/screens/login_screen.dart';
import 'package:luirlogginpage/screens/SignUp_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: 'SignIn',
      routes: {
        'SignIn':(context)=>LoginScreen(),
        'SignUp':(context)=>SignUpScreen(),
      },

    );
  }
}