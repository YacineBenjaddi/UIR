import 'dart:convert';
import 'dart:core';
import 'package:LoisirProj/controller/utilities/ApiUrl.dart';
import 'package:LoisirProj/controller/utilities/Services.dart';
import 'package:LoisirProj/controller/utilities/constants.dart';
import 'package:LoisirProj/view/profile.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class EditPassword extends StatefulWidget {
  final String email;
  EditPassword(this.email);

  @override
  _EditPasswordState createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  TextEditingController pass = new TextEditingController();
  TextEditingController pass1 = new TextEditingController();
  TextEditingController pass2 = new TextEditingController();

  String password;
  String newpassword;
  String confirmpassword;

  @override
  void initState() {
    super.initState();

    email = widget.email;

  }

  String email;
  var key = new GlobalKey<FormState>();
  var key1 = new GlobalKey<FormState>();
  var key2 = new GlobalKey<FormState>();

  VerifierText(){
    final form = key.currentState;
    print(form);
    if(form.validate()){
      form.save();
      CheckPassword();
    }
  }

 /* CheckPassword() async {
    print("user $pass");
    final response = await http.post(ApiUrl.login, body: {
      "email": email,
      "password":pass.text,
    });

    var datauser = json.decode(response.body);
      print("dataaaaaaaaaaaa length ${datauser.length}");

    if (datauser.length == 0) {

      setState(() {

        PopUp_edit_Fail();

      });
    }


    else if(pass1.text!=pass2.text){
      PopUp_notequal();
    }else{
      UpdatePassword();
    }
  }*/

  CheckPassword()async {

    final response = await Services.CheckPassword(email, pass.text);
    print('respoooooooooooooooooooooooooooooooooooooooooose $response');

    if (response == 'success') {
     if(pass1.text!=pass2.text){
      PopUp_notequal();
    }else{
      UpdatePassword();
    }
    }
    else if(response =='error'){
      setState(() {

        PopUp_edit_Fail();

      });
    }
  }

int PopUp_edit_Fail() {
  showDialog(
    context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(" ERROR",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Montserrat')),
          content: Text("Password not found",
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

  int PopUp_notequal() {
    showDialog(
      context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(" ERROR",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat')),
            content: Text("Confirm your new password corretly",
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
  var loading = false;


 /* UpdatePassword()async {

    final response = await http.post(ApiUrl.addpassword, body: {"email":email, "password": pass1.text});

    var data = json.decode(response.body);

    int value = data['value'];
    print("Value is : $value");
    if (value == 1) {
      // PopUp();
      var route = new MaterialPageRoute(
        builder: (BuildContext context) => new ProfilePage(email: email),
      );
      Navigator.of(context).push(route);
    }
  }*/

  UpdatePassword()async {

    final response = await Services.UpdatePassword(widget.email, pass1.text);
    print('respoooooooooooooooooooooooooooooooooooooooooose $response');

    if (response == 'success') {

      var route = new MaterialPageRoute(
        builder: (BuildContext context) => new ProfilePage(),
      );
      Navigator.of(context).push(route);
    }else{
      print("Update problem ppppppppppppppp");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          BackButtonWidget(),
          Form(
            key: key,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Text(
                  'Current password',
                  style: kLabelStyle,
                ),
                Container(
                  alignment: Alignment.centerLeft,

                  height: 60.0,
                  child: TextFormField(
                    onSaved: (e) => password = e,
                    validator : (e) {
                      if (e.isEmpty) {
                        return "Enter your current password please!";
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                    ),
                    controller: pass,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14.0),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      hintText: 'Enter your current password ',
                      fillColor: Colors.black ,
                    ),
                  ),
                ),

                Text(
                  'New Password',
                  style: kLabelStyle,
                ),
                SizedBox(height: 20.0),
                Container(
                  alignment: Alignment.centerLeft,

                  height: 60.0,
                  child: TextFormField(
                    onSaved: (e) => newpassword = e,
                    validator : (e) {
                      if (e.isEmpty) {
                        return "Enter your new password please!";
                      }
                    },
                    obscureText: true,
                    style: TextStyle(

                      color: Colors.black,
                      fontFamily: 'OpenSans',
                    ),
                    controller: pass1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14.0),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      hintText: 'Enter your new Password',
                      fillColor: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  alignment: Alignment.centerLeft,

                  height: 60.0,
                  child: TextFormField(
                    onSaved: (e) => confirmpassword = e,
                    validator : (e) {
                      if (e.isEmpty) {
                        return "Confirm your new password please!";
                      }
                    },
                    obscureText: true,
                    style: TextStyle(

                      color: Colors.black,
                      fontFamily: 'OpenSans',
                    ),
                    controller: pass2,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14.0),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      hintText: 'Confirm your new Password',
                      fillColor: Colors.black,

                    ),
                  ),
                ),
              ],
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