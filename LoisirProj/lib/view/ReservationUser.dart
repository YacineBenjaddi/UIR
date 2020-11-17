import 'dart:convert';

import 'package:LoisirProj/controller/utilities/ApiUrl.dart';
import 'package:LoisirProj/model/User.dart';
import 'package:LoisirProj/model/reservation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var id_user;
var hor;
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

  Future<List<reservation>> fetchreservation(String id_user) async {
    final response = await http.post(ApiUrl.getRes, body: {
      "id_user": id_user,
    });
    var tpe= json.decode(response.body);

    typee=tpe[0]["type"];


    return footFromJson(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          child: FutureBuilder(
              future: fetchreservation(widget.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {

                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, index) {
                        hor = snapshot.data[index];
                        print ("horrrr ${hor.type}");
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
                                new Text(" Terrain : "+hor.type,style: TextStyle(fontSize: 15.0),),
                              //  new Text(basket.dispo,style: TextStyle(fontSize: 20.0),)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return CircularProgressIndicator();
              }
          ),
        ),





    ),
    );


  }



}
