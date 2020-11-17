import 'dart:convert';

import 'package:LoisirProj/controller/utilities/ApiUrl.dart';
import 'package:flutter/material.dart';


import 'SignupPassword.dart';
import 'ValidateCode.dart';
import 'package:http/http.dart' as http;

class SignupEmail extends StatefulWidget {
  @override
  _SignupEmailState createState() => _SignupEmailState();
}

class _SignupEmailState extends State<SignupEmail> {

  GlobalKey<ScaffoldState> _scaffoldKey;

  TextEditingController _last_nameController;

  TextEditingController _first_nameController;


  TextEditingController _emailController;
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  TextEditingController _passwordController;
  TextEditingController _profileController;

  String _titleProgress;

  @override
  void initState() {
    super.initState();


    _scaffoldKey = GlobalKey();
    _last_nameController = TextEditingController();
    _first_nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _profileController = TextEditingController();
  }


  int PopUp_Check_Fail() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(" ERROR",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat')),
            content: Text("your password exist in Data Base",
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

  int PopUp() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(" Message log",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat')),
            content: Text("check is correct",
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


  Future<List> Check() async {
    print("user $email");
    final response = await http.post(ApiUrl.check, body: {
      "email": email.text,
    });

    var datauser = json.decode(response.body);

    if (datauser[0]['password'] != '') {
      setState(() {
        PopUp_Check_Fail();

      });
    }
    else{

      var route = new MaterialPageRoute(
        builder: (BuildContext context) => new SignupPassword( email.text),
      );
      Navigator.of(context).push(route);
    }

    return datauser;
  }
  _showProgress(String message) {
    setState(() {
      _titleProgress = message;
    });
  }

  _showSnackBar(context, message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  int SuccessPopup() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(" success",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat')),
            content: Text("your addition has been successfully completed",
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



  _clearValues() {
    _last_nameController.text = '';
    _first_nameController.text = '';
    _emailController.text = '';
    _passwordController.text = '';
    _profileController.text = '';
  }

  String Name,Fname,Email,Pass,Profil;
  var key = new GlobalKey<FormState>();
  VerifierText(){
    final form = key.currentState;
    print(form);
    if(form.validate()){
      form.save();
      // _addUser();
      Check();

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          BackButtonWidget(),
          SizedBox(
            height: 20,
          ),
          Form(
            key: key,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.email), onPressed: null),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(right: 20, left: 10),
                          child: TextFormField(
                            onSaved: (e) => Email = e,
                            validator : (e) {
                              if (e.isEmpty) {
                                return "Enter your email please!";
                              }
                            },
                            controller: email,
                            decoration: InputDecoration(hintText: 'Email'),
                          )))
                ],
              ),
            ),
          ),

          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 60,
                child: RaisedButton(
                  onPressed: () {
                    VerifierText();
                  },
                  color: Colors.blueAccent,
                  child: Text(
                    'Check',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),



                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/images/bg.jpg'))),
      child: Positioned(
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: 20,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.blueGrey,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      Text(
                        'Back',
                        style: TextStyle(
                            color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  )),
              Positioned(
                bottom: 20,
                left: 50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Please enter your Email',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ),
              )
            ],
          )),
    );
  }
}