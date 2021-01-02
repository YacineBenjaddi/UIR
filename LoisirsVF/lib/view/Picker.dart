import 'dart:convert';
import 'package:LoisirProj/controller/utilities/Services.dart';
import 'package:LoisirProj/model/reservation.dart';
import 'package:LoisirProj/view/profile.dart';
import 'package:jiffy/jiffy.dart';
import 'package:LoisirProj/controller/utilities/ApiUrl.dart';
import 'package:LoisirProj/model/horaire.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import "package:flutter/cupertino.dart";
import 'package:http/http.dart' as http;
import 'package:LoisirProj/controller/utilities/Notification.dart';



import 'homepage.dart';
var day_calendar,day_nam,gender,profile,id_user,email;
class Picker extends StatefulWidget {
  String id_loisir,capacite;
  Picker({this.id_loisir,this.capacite});
  @override
  _PickerState createState() => _PickerState();

}


Future<List<horaire>> getDispo(String id_loisir, DateTime d,String capacite) async {

  var result= await Services.getDispoPiscine(id_loisir, day_calendar, gender, profile,capacite);


  if (id_loisir == "2") {

    return result;

  }
  else {
    final DateTime now = DateTime.now();
    var hour;

    String da = "${day_calendar}".split(' ')[0];
    String n= "${now}".split(' ')[0];
    if (n==da) {
      hour = "${now.hour}";
    }
    else if (d.isAfter(now)) {
      hour = "8";
    } else {
      return null;
    }
    if(id_loisir == "4") {
      final response = await http.post(ApiUrl.getDispoTerrain, body: {"hour":"18","hour_max":"24",
        "hour_not":"24","hour_now":hour,"date_res":da,"id_loisir":id_loisir,"capacite":capacite,
      });

      return horaireFromJson(response.body);
    }else{
      final response = await http.post(ApiUrl.getDispoTerrain, body: {"hour": hour,"hour_max":"24",
        "hour_not":"24","hour_now":hour,"date_res":da,"id_loisir":id_loisir,"capacite":capacite,
      });

      return horaireFromJson(response.body);
    }}
}

class _PickerState extends State<Picker> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationPlugin
        .setListenerForLowerVersions(onNotificationInLowerVersions);
    notificationPlugin.setOnNotificationClick(onNotificationClick);

    getDispo(widget.id_loisir,day_calendar,widget.capacite);

    Services.getDispoPiscine(widget.id_loisir, day_calendar, gender, profile,widget.capacite);

    // getDispoPiscine(widget.type,day_calendar, gender, profile);
    _controller = CalendarController();
    initial();
  }

  Future<String> addReservation(String cre,DateTime d, String id) async{
    String da = "${d}".split(' ')[0];
    print("testt id ${widget.id_loisir}");
    final result = await Services.addReservation(da,cre, d,widget.id_loisir, id, widget.capacite);
    print("response Pisonceee ${result}");
    var data=jsonDecode(result);
    print("wwwwwwwwwwwwwwwwwwwwww ${data.toString()}");
    return data.toString();
  }

  int PopUp_Confirmer(String cre,DateTime d, String id) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(" Message log",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat')),
            content: Text("Etes vous sure de choisir ce creneau ?",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Montserrat')),
            actions: <Widget>[
              FlatButton(
                child: Text("Confirmer"),
                onPressed: () async{

                  Navigator.of(context).pop();
                  // String test;
                  addReservation(cre,d,id).then((result) async {
                    if (result=='success') {
                      print("daaaaaateeeetimmmmmmmmmmme $d");
                      //await notificationPlugin.showNotification();
                      await notificationPlugin.scheduleNotificationCancel(d, cre);
                      await notificationPlugin.scheduleNotificationAlert(d, cre);

                      /*Navigator.pushReplacement(
                          context, new MaterialPageRoute(builder: (context) => homepage(email)));*/
                    } else {
                      print("ressss"+result);
                      PopUp_Fail();
                    }
                  });
                  //reserve(String cre,DateTime d,String type, String id);
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
            content: Text("ce creneau est indisponible",
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
  SharedPreferences logindata;
  CalendarController _controller;
  @override


  TextStyle dayStyle(FontWeight fontWeight)
  {
    return TextStyle(color: Colors.blueGrey, fontWeight: fontWeight);
  }

  @override
  void dispose()
  {
    super.dispose();
    _controller.dispose();
  }
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      gender = logindata.getString('gender');
      profile=logindata.getString('profile');
      id_user=logindata.getString('id_user');
      email=logindata.getString('username');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,

        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30,),

              TableCalendar(


                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarStyle: CalendarStyle(

                    weekdayStyle: dayStyle(FontWeight.normal),
                    weekendStyle: dayStyle(FontWeight.normal),
                    selectedColor: Colors.blueGrey,
                    todayColor: Colors.blueAccent
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                    weekendStyle: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                    dowTextBuilder: (date, locale){

                      return DateFormat.E(locale).format(date).substring(0,1);
                    }

                ),
                headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleTextStyle: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 20, fontWeight: FontWeight.bold,
                    ),
                    leftChevronIcon: Icon(
                      Icons.chevron_left,
                      color: Colors.blueAccent,
                    ),
                    rightChevronIcon: Icon(
                      Icons.chevron_right,
                      color: Colors.blueAccent,
                    )
                ),
                calendarController: _controller,
                onDaySelected: (day, events, holidays) {

                  day_calendar=day;
                  setState(() {

                    getDispo(widget.id_loisir, day,widget.capacite);


                  });
                  day_nam= DateFormat('EEEE').format(day);

                  print("day nameeeeeeeeee : $day_nam and gender $gender profile $profile ");


                } ,

              ),

              Container(

                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.55,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular((50)), topRight: Radius.circular(50)),

                    color:Colors.blueGrey,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            colors: [
                              Colors.blue[800].withOpacity(0),
                             // Colors.blueGrey.withOpacity(0),
                              Colors.indigoAccent,
                            ],
                            stops: [
                              0.0,
                              0.5,

                            ]
                        )
                    ),
                    child: FutureBuilder(
                      future: getDispo(widget.id_loisir, day_calendar,widget.capacite),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(

                            itemCount: snapshot.data.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, index) {
                              horaire basket = snapshot.data[index];
                              return new Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                color: Colors.green,
                                child: InkWell(
                                  child: new Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: new Row(
                                      children: <Widget>[

                                        new Text(basket.creneau,style: TextStyle(fontSize: 25.0),),
                                        //  new Text(basket.numero,style: TextStyle(fontSize: 20.0),),
                                        //  new Text(basket.dispo,style: TextStyle(fontSize: 20.0),)
                                      ],
                                    ),
                                  ),


                                  onTap: () {
                                    PopUp_Confirmer(basket.id_horaire,day_calendar,id_user);
                                  },
                                ),
                              );
                            },
                          );
                        }
                        return

                          Column(
                            children: [
                              CircularProgressIndicator(
                                backgroundColor: Colors.cyanAccent,
                                valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),

                              ),
                              Text("cliquer sur une date valide")
                            ],
                          );

                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  onNotificationInLowerVersions(ReceivedNotification receivedNotification) {
    print('Notification Received ${receivedNotification.id}');
  }

  onNotificationClick(String payload) {
    print('Payload $payload');
  }
}
