import 'dart:convert';
import 'dart:core';
import 'package:flutter_session/flutter_session.dart';
import 'package:intl/intl.dart';
import 'package:LoisirProj/controller/utilities/ApiUrl.dart';
import 'package:LoisirProj/controller/utilities/constants.dart';

import 'package:LoisirProj/model/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../main.dart';
import '../../homepage.dart';
import '../../homepage.dart';

import 'SignupEmail.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();


  String msg = '';
  String id_user,nb_block,date_fin;
  int difference;

  SharedPreferences logindata;
  bool newuser;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }
  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => homepage(email: user.text)));
    }
  }

  @override
  void dispose() {
  // Clean up the controller when the widget is disposed.
  user.dispose();
  pass.dispose();
  super.dispose();
  }

  Future<List<User>> getId() async {
    final response = await http.post(ApiUrl.getOne, body: {
      "email": user.text,
    });
    var datauser = json.decode(response.body);

    if (datauser.length > 0) {

      nb_block = datauser[0]['nb_block'];
      date_fin = datauser[0]['date_fin_block'];
      print("$date_fin $nb_block");
      _login();
    }else{
      nb_block='0';
      date_fin='1900-01-01';
      _login();
    }
    return datauser;
  }
  Future<List> _login() async {

    print("***********************");
    print(user.text);
    print(pass.text);
    final response =
    await http.post(ApiUrl.login, body: {
      "email": user.text,
      "password": pass.text,
    });

    var datauser = json.decode(response.body);


    if (datauser.length == 0) {

      setState(() {
        msg = "Login Fail";
        PopUp_Login_Fail();

      });
    }

    if (datauser[0]['profile'] == 'User' ) {
      logindata.setBool('login', false);
      logindata.setString('username', user.text);

      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String formatted = formatter.format(now);
      print(formatted);
      print(date_fin);
      difference = now.difference(DateTime.parse(date_fin)).inDays;
      if(int.parse(nb_block)>2){
      PopUp_Suspendu();
      }else if(difference<0){
       PopUp_Block_temporory();
      }else if(int.parse(datauser[0]['penalty'])<3){

        Navigator.of(context).pushReplacementNamed("/home");
      }
    }

    return datauser;
  }




  int PopUp_Login_Fail() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(" ERROR",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat')),
            content: Text("your email or password is incorrect",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat')),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
  int PopUp_Block_temporory() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(" ERROR",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat')),
            content: Text("your account is blocked for a while",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat')),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
  int PopUp_Suspendu() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(" ERROR",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat')),
            content: Text("your account is susspendu",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat')),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  String Email,Pass;
  var key = new GlobalKey<FormState>();
 // var key1 = new GlobalKey<FormState>();
  VerifierText(){
    final form = key.currentState;
   // print(form);
    if(form.validate()){
      form.save();
      getId();

    }
  }



  Widget _buildPasswordTF() {

    return SingleChildScrollView(

      scrollDirection: Axis.vertical,
      physics: ClampingScrollPhysics(),

      child: Form(
        key: key,

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Text(
              'Email',
              style: kLabelStyle,
            ),
            SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: 60.0,
              child: TextFormField(
                onSaved: (e) => Email = e,
                validator : (e) {
                  if (e.isEmpty) {
                    return "Enter your email please!";
                  }
                },
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                ),
                controller: user,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  hintText: 'Enter your Email',
                  hintStyle: kHintTextStyle,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Password',
              style: kLabelStyle,
            ),
            SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: 60.0,
              child: TextFormField(
                onSaved: (e) => Pass = e,
                validator : (e) {
                  if (e.isEmpty) {
                    return "Enter your password please!";
                  }
                },
                obscureText: true,
                style: TextStyle(

                  color: Colors.white,
                  fontFamily: 'OpenSans',
                ),
                controller: pass,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  hintText: 'Enter your Password',
                  hintStyle: kHintTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget _buildForgotPassword() {

    return Container(

      height: 20.0,

      child: Row(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
      InkWell(
        onTap: (){
          Navigator.pushNamed(context, 'CheckEmail');

        },
        child: Text(
            'Forgot Password',
            style: kLabelStyle,
          ),
      ) ],
      ),
    );
  }

  Widget _buildLoginBtn() {
    return InkWell(
      onTap: () {
        VerifierText();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25.0),
        width: double.infinity,
        child: RaisedButton(
          elevation: 5.0,
        //  onPressed: () => print('Login Button Pressed'),
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.white,
          child: Text(
            'LOGIN',
            style: TextStyle(
              color: Color(0xFF527DAA),
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        Text(
          '- Powered By -',
          style: kLabelStyle,
        ),

      ],
    );
  }

  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
                () => print('UIR'),
            AssetImage(
              'assets/images/uir.jpg',
            ),
          ),

        ],
      ),
    );
  }





  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      //_buildEmailTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),

                      _buildForgotPassword(),
                      _buildLoginBtn(),
                      _buildSignInWithText(),
                      _buildSocialBtnRow(),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: (){
                          var route = new MaterialPageRoute(
                            builder: (BuildContext context) => new SignupEmail(),
                          );
                          Navigator.of(context).push(route);

                        },

                        child: Center(
                          child: RichText(
                            text: TextSpan(
                                text: 'Don\'t have an account?',
                                style: TextStyle(color: Colors.white),
                                children: [
                                  TextSpan(
                                    text: '   SIGN UP',
                                    style: TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.bold),
                                  )
                                ]),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}