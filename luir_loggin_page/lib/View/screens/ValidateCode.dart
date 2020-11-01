import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:luirlogginpage/Controller/utilities/ApiUrl.dart';
import 'package:luirlogginpage/Controller/utilities/constants.dart';
import 'package:luirlogginpage/model/User.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

import 'ForgotPassword.dart';

class ValidateCode extends StatefulWidget {
  final String email;

  ValidateCode(this.email);


  @override
  _ValidateCodeState createState() => _ValidateCodeState();
}

class _ValidateCodeState extends State<ValidateCode> {



  void initState() {
    super.initState();
    _getOne();
    //get_code();
    getCode();
  }


  String code;

  String password;
  var key = GlobalKey<FormState>();

  VerifierText() {
    final form = key.currentState;
    if (form.validate()) {
      form.save();
      submit();
    }
  }

  Future<List<User>> getCode() async {
    var msg = "";
    final response = await http.post(ApiUrl.getOne, body: {
      "email": widget.email,
    });
    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        msg = "Login Fail";
      });
    }

    if (datauser.length > 0) {
      setState(() {
        print(datauser);

        code = datauser[0]['reset'];
      });
    }
    return datauser;
  }


  sendMail() async {
    String username = "tetsuyakuro13@gmail.com";
    String password = "tetsuyakuro123"; //passsword
    final smtpServer = gmail(username, password);
// Creating the Gmail server
// Create our email message.
    final message = Message()
      ..from = Address(username)
      ..recipients.add(widget.email) //recipent email
//..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com']) //cc Recipents emails
//..bccRecipients.add(Address('bccAddress@example.com')) //bcc Recipents emails
      ..subject =
          'Subject : ${DateTime.now()}​​' //subject of the email
//..text =
//'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<h3>Votre code de verification est :  </h3> "+code;

    try {
      final sendReport = await send(message, smtpServer);
      //showToast('Message Send Check your mail',gravity: Toast.CENTER,duration: 3);
      print('Message sent: ' + sendReport.toString()); //print if the email is sent
    } on MailerException catch (e) {
      print('Message not sent. \n' + e.toString()); //print if the email is not sent
// e.toString() will show why the email is not sending
    }

  }


  submit() async {
    /*setState(() {
      loading = true;
    });*/
    final response = await http
        .post(ApiUrl.validate, body: {"email": widget.email, "code": code});

    var data = json.decode(response.body);
    int value = data['value'];
    String message = data['message'];
    if (value == 1) {
      //print("Valide");
      _getOne();
      //PopUp_code_valid();
      var route = new MaterialPageRoute(
        builder: (BuildContext context) => new ForgotPassword(widget.email),
      );
      Navigator.of(context).push(route);
    } else {
      PopUp_code_Fail();
    }
  }

  int PopUp_code_Fail() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(" ERROR",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat')),
            content: Text(
                "Your password code is incorrect!" + " check it again please",
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



  Future<List<User>> _getOne() async {
    var msg = "";
    final response = await http.post(ApiUrl.getOne, body: {
      "email": widget.email,
    });
    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        msg = "Login Fail";
      });
    }

    if (datauser.length > 0) {
      setState(() {
        password = datauser[0]['password'];
      });
    }
    return datauser;
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
            key:key,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.code), onPressed: null),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(right: 20, left: 10),
                          child: TextFormField(
                            onSaved: (e) => code = e,
                            validator : (e) {
                              if (e.isEmpty) {
                                return "Enter your verification code please!";
                              }
                            },
                            decoration: InputDecoration(hintText: 'Verification Code'),
                          )

                      )

                  )

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
          SizedBox(
            height: 40,
          ),
          FlatButton(
              onPressed: () {
                sendMail();
              },
              child: Text(
                "Verification code",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  fontFamily: 'Roboto-Regular',

                ),
              )
          )

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
                    'Type the verification code',
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