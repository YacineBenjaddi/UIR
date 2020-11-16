import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

import 'View/screens/sign/CheckEmail.dart';


import 'View/screens/sign/login_screen.dart';
import 'view/homepage.dart';
import 'view/homepage.dart';
import 'view/homepage.dart';



 main() async {

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
        '/home':(context)=>homepage(),
        //'ValidateCode':(context)=>ValidateCode(),
      },

    );
  }
}