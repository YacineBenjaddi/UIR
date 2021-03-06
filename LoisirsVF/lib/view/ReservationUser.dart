import 'dart:convert';

import 'package:LoisirProj/controller/utilities/ApiUrl.dart';
import 'package:LoisirProj/controller/utilities/Services.dart';
import 'package:LoisirProj/model/User.dart';
import 'package:LoisirProj/model/reservation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var id_user;

class reservationUser extends StatefulWidget {
  String email, id;


  reservationUser({this.email, this.id});

  @override
  _reservState createState() => _reservState();
}

class _reservState extends State<reservationUser> {
  var typee;

  @override
  void initState()
  {

    fetchreservation(widget.id);
    //fetchreservationbasket(widget.id);
  }

  /*Future<List<reservation>> fetchreservation(String id_user) async {
    final response = await http.post(ApiUrl.getRes, body: {
      "id_user": id_user,
    });
    var tpe= json.decode(response.body);

    typee=tpe[0]["type"];


    return footFromJson(response.body);
  }
  */


  Future<List<reservation>> fetchreservation(String id_user) async {
    final result = await Services.fetchreservation(id_user);

    if(result == null){
      print("votre reservation est null");
    }else{

      var tpe= json.decode(result);

      typee=tpe[0]["type"];


      return footFromJson(result);
    }}
 /* RemoveReservation(String id,String type) async {
   // print("$id");
    final response = await http.post(ApiUrl.removeRes, body: {
      "id_res": id,"type":type,
    });
    var tpe= json.decode(response.body);
    return tpe.toString();
  }
  */

  RemoveReservation(String id, String id_h,String date_r) async {
    // print("$id");
    final result = await Services.RemoveReservation(id,id_h,date_r);
    var tpe= json.decode(result);
    return tpe.toString();
  }

  choice(String id){
    if(id=="1"){
      return"Foot";
    }
    else if(id=="2"){
      return"Piscne";
    }
    else if(id=="3"){
      return"Tennis";
    }
    else if(id=="4"){
      return"Salle de Musculation";
    }
    else{
      return"Basket";
    }

  }
  int PopUp_Remove(String id_r,String id_h,String date_r) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(" Confirmation",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat')),
            content: Text("Etes vous sure d'annuler votre reservation ?",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat')),
            actions: <Widget>[
              FlatButton(

                child: Text("OK"),
                onPressed: () {

                  Navigator.of(context).pop();
                  RemoveReservation(id_r,id_h,date_r).then((result) {
                    if (result=='success') {
                      setState(() {reservationUser(email:widget.email,id:widget.id);});
                    } else {
                      print("ressss"+result);
                      PopUp_Fail();
                    }
                  });
                },
              )
            ],
          );
        });
  }

  int PopUp_Fail() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(" ERROR",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat')),
            content: Text("supression echouee",
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
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
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
          child: FutureBuilder(
              future: fetchreservation(widget.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {

                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                      reservation hor = snapshot.data[index];
                      print ("horrrr ${hor.id_loisir}");
                      /*  print("test ${hor.type}");*/
                      return new Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),

                        child: InkWell(
                          child: new Container(

                            padding: EdgeInsets.all(15.0),
                            child: new Row(

                              children: <Widget>[
                                new Padding(padding: EdgeInsets.only(right: 10.0)),
                                new Text(hor.id_horaire+":00",style: TextStyle(fontSize: 20.0),),
                                new Padding(padding: EdgeInsets.only(right: 20.0)),
                                new Text("Date : "+hor.date_res,style: TextStyle(fontSize: 15.0),),
                                //    hor.id_loisir==1? new Text(" Terrain : Foot ",style: TextStyle(fontSize: 15.0),): hor.id_loisir==2? new Text(" Piscine ",style: TextStyle(fontSize: 15.0),):hor.id_loisir==3?new Text(" Terrain : Tennis ",style: TextStyle(fontSize: 15.0),):hor.id_loisir==4?new Text(" Salle de Musculation",style: TextStyle(fontSize: 15.0),):new Text("Terrain: Basket",style: TextStyle(fontSize: 15.0),),
                                // new Text(basket.dispo,style: TextStyle(fontSize: 20.0),)
                                new Text(" "+choice(hor.id_loisir),style: TextStyle(fontSize: 15.0),),

                              ],

                            ),

                          ),
                          onTap: () {
                            PopUp_Remove(hor.id_res,hor.id_horaire,hor.date_res);
                          },
                        ),

                      );
                    },
                  );
                }
                return SizedBox(
                    height: 300.0,
                    width: 300.0,
                    child:
                    CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.blue),
                        strokeWidth: 5.0)
                );
              }
          ),
        ),





      ),
    );


  }



}
