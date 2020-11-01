import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:luirlogginpage/Controller/utilities/ApiUrl.dart';

class ForgotPassword extends StatefulWidget {
  final String email;
  ForgotPassword(this.email);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {


  String password;
  @override
  void initState() {
    super.initState();

    email = widget.email;

  }

  String email;
  var key = new GlobalKey<FormState>();


  VerifierText(){
    final form = key.currentState;
    print(form);
    if(form.validate()){
      form.save();
      UpdatePassword();
    }
  }

  var loading = false;

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
            content: Text("Update is correct",
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

  UpdatePassword()async {

    final response = await http.post(ApiUrl.addpassword, body: {"email": widget.email, "password": password});

    var data = json.decode(response.body);

    int value = data['value'];
    print("Value is : $value");
    if (value == 1) {
      PopUp();
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
                  IconButton(icon: Icon(Icons.lock), onPressed: null),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(right: 20, left: 10),
                          child: TextFormField(
                            onSaved: (e) => password = e,
                            validator : (e) {
                              if (e.isEmpty) {
                                return "Enter your password please!"
                                ;
                              }
                            },
                            decoration: InputDecoration(hintText: 'Password'),
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
                    'Validate',
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
                    'please Type your new password',
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