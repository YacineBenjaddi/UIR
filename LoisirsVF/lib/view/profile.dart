import 'dart:convert';

import 'package:LoisirProj/controller/utilities/ApiUrl.dart';
import 'package:LoisirProj/controller/utilities/Services.dart';
import 'package:LoisirProj/model/User.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:http/http.dart' as http;

import 'ReservationUser.dart';
import 'screens/sign/EditPassword.dart';

class ProfilePage extends StatefulWidget {
  final String payload;
  ProfilePage({this.payload});


  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isOpen = false;
  PanelController _panelController = PanelController();
  var id,Fname,Lname,email,gender,password,code, year, branch, pinalite,photo;

  @override
  void initState(){
    id="";
    Fname="";
    Lname="";
    gender="";
    password="";
    code="";
    year="";
    branch="";
    pinalite="";
    photo="";
    _getOne();

  }


  /*Future<List<User>> _getOne() async {
    var msg = "";
    print("getOneUser $email");
    final response = await http.post(ApiUrl.getOne, body: {
      "email": email,
    });
    var datauser = json.decode(response.body);



    if (datauser.length == 0) {
      setState(() {
        msg = "user not found";
      });
    }

    if (datauser.length > 0) {
      setState(() {
        print(datauser);
        id = datauser[0]['id_user'];
        Lname = datauser[0]['last_name'];
        Fname = datauser[0]['first_name'];
        email = datauser[0]['email'];
        password = datauser[0]['password'];
        code = datauser[0]['code'];
        gender = datauser[0]['gender'];
        year = datauser[0]['year'];
        branch = datauser[0]['branch'];
        pinalite = datauser[0]['penalty'];
        photo = datauser[0]['photo'];
      });
    }
    return datauser;
  }*/
  SharedPreferences logindata;
  String username;

  Future<List<User>> _getOne() async {
    logindata = await SharedPreferences.getInstance();
    username = logindata.getString('username');
    final result = await Services.getOneProfile(username);
    var dataprofile = json.decode(result);

    var msg = "";

    if (dataprofile.length == 0) {
      setState(() {
        msg = "user not found";
      });
    }

    if (dataprofile.length > 0) {
      setState(() {
        print(dataprofile);
        id = dataprofile[0]['id_user'];
        Lname = dataprofile[0]['last_name'];
        Fname = dataprofile[0]['first_name'];
        email = dataprofile[0]['email'];
        password = dataprofile[0]['password'];
        code = dataprofile[0]['code'];
        gender = dataprofile[0]['gender'];
        year = dataprofile[0]['year'];
        branch = dataprofile[0]['branch'];
        pinalite = dataprofile[0]['penalty'];
        photo = dataprofile[0]['photo'];
      });
    }
    return dataprofile;
  }


  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(

            alignment: Alignment.topCenter,
            heightFactor: 0.7,
            child: Container(
              color: Colors.blueAccent,
             child: Image.network(ApiUrl.imagesProfiles+photo),
            ),
          ),

          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.3,
            child: Container(
              color: Colors.white,
            ),
          ),

          /// Sliding Panel
          SlidingUpPanel(
            controller: _panelController,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(32),
              topLeft: Radius.circular(32),
            ),
            minHeight: MediaQuery.of(context).size.height * 0.35,
            maxHeight: MediaQuery.of(context).size.height * 0.85,
            body: GestureDetector(
              onTap: () => _panelController.close(),
              child: Container(
               // color: Colors.blueAccent,
              ),
            ),
            panelBuilder: (ScrollController controller) =>
                _panelBody(controller),
            onPanelSlide: (value) {
              if (value >= 0.2) {
                if (!_isOpen) {
                  setState(() {
                    _isOpen = true;
                  });
                }
              }
            },
            onPanelClosed: () {
              setState(() {
                _isOpen = false;
              });
            },
          ),
        ],
      ),
    );
  }

  /// **********************************************
  /// WIDGETS
  /// **********************************************

  /// Panel Body
  SingleChildScrollView _panelBody(ScrollController controller) {
    double hPadding = 40;

    return SingleChildScrollView(
      controller: controller,
      physics: ClampingScrollPhysics(),
      child: Column(
        children: <Widget>[
          Container(

            padding: EdgeInsets.symmetric(horizontal: hPadding),
            height: MediaQuery.of(context).size.height * 0.35,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _titleSection(),
                _infoSection(),
                _actionSection(hPadding: hPadding),
              ],
            ),
          ),

        ],
      ),
    );
  }

  /// Action Section
  Row _actionSection({double hPadding}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Visibility(
          visible: !_isOpen,
          child: Expanded(
            child: OutlineButton(
              onPressed: () => { Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => reservationUser(email:email,id: id)),
              )
            },
              borderSide: BorderSide(color: Colors.blueAccent),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                'RESERVATIONS',
                style: TextStyle(
                  fontFamily: 'NimbusSanL',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: !_isOpen,
          child: SizedBox(
            width: 16,
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: SizedBox(
              width: _isOpen
                  ? (MediaQuery.of(context).size.width - (2 * hPadding)) / 1.6
                  : double.infinity,
              child: OutlineButton(
                onPressed: () => { Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditPassword(username)),
                )
              },

                textColor: Colors.blueAccent,
                borderSide: BorderSide(color: Colors.blueAccent),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  'EDIT PASSWORD',
                  style: TextStyle(
                    fontFamily: 'NimbusSanL',
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }


  /// Info Section
  Row _infoSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _infoCell(title: '         User number', value: "$code"),

        Container(
          width: 2,
          height: 40,
          color: Colors.blueAccent,
        ),
        _infoCell(title: 'Number of penalty', value: "$pinalite"),
      ],
    );
  }

  /// Info Cells
  Column _infoCell({String title, String value}) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  /// Title Section
  Column _titleSection() {
    return Column(
      children: <Widget>[
        Text(
          "     $Lname $Fname",
          style: TextStyle(
            fontFamily: 'NimbusSanL',
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "$branch $year ",
          style: TextStyle(
            fontFamily: 'NimbusSanL',
            fontStyle: FontStyle.italic,
            fontSize: 16,
            color: Colors.blueGrey,
          ),
        ),
        Text(
          "$email",
          style: TextStyle(
            fontFamily: 'NimbusSanL',
            fontStyle: FontStyle.italic,
            fontSize: 16,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}

