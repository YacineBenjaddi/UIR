import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:luirlogginpage/Controller/utilities/ApiUrl.dart';

import 'ValidateCode.dart';
import 'package:http/http.dart' as http;

class CheckEmail extends StatefulWidget {
  @override
  _CheckEmailState createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmail> {


  String email;
  var key = new GlobalKey<FormState>();




  VerifierText(){
    final form = key.currentState;
    print(form);
    if(form.validate()){
      form.save();
      submit();
    }
  }

  var loading = false;

  submit()async{
    setState(() {
      loading = true;
    });

    final response = await http.post(ApiUrl.submit,body: {"email": email.trim()});

    print("l'email est = $email");

    var data = json.decode(response.body);
    print("la valeur du data est = $data");
    int value = data['value'];

    if(value == 1){
      Navigator.push(context, MaterialPageRoute(
          builder: (context)=> ValidateCode(email)));

    }else{
      //print(message);
      PopUp_email_Fail();
    }
  }

  int PopUp_email_Fail() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(" ERROR",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat')),
            content: Text("Your email is introvable",
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
                            onSaved: (e) => email = e,
                            validator : (e) {
                              if (e.isEmpty) {
                                return "Enter your email please!";
                              }
                            },
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
                    'Please Validate your Email',
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