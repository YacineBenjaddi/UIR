import 'package:flutter/material.dart';

import 'View/screens/CheckEmail.dart';
import 'View/screens/ForgotPassword.dart';

import 'View/screens/login_screen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      initialRoute: 'SignIn',
      routes: {
        'SignIn':(context)=>LoginScreen(),

        //'ForgotPassword':(context)=>ForgotPassword(),
        'CheckEmail':(context)=>CheckEmail(),
        //'ValidateCode':(context)=>ValidateCode(),
      },

    );
  }
}
