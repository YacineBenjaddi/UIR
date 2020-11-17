import 'dart:convert';

import 'package:LoisirProj/controller/utilities/ApiUrl.dart';
import 'package:LoisirProj/model/horaire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import "package:flutter/cupertino.dart";
import 'package:http/http.dart' as http;
var day_calendar;
class Picker extends StatefulWidget {
  String type;
  Picker(this.type);
  @override
  _PickerState createState() => _PickerState();

}

Future<List<horaire>> getDispo(String type, DateTime d) async {
  final DateTime now = DateTime.now();
  var hour;
  String da="${day_calendar}".split(' ')[0];

  if(now.day==d.day){
     hour= "${now.hour}";
  }
  else if(d.day>now.day){
     hour= "8";

  }else{
    return null;
  }

  final response = await http.post(ApiUrl.getDispo, body: {
    "type": type,"date_res":da,"hour": hour,
  });

  return horaireFromJson(response.body);

}

class _PickerState extends State<Picker> {
  CalendarController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDispo(widget.type,day_calendar);
    _controller = CalendarController();
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30,),
              TableCalendar(
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarStyle: CalendarStyle(
                    weekdayStyle: dayStyle(FontWeight.normal),
                    weekendStyle: dayStyle(FontWeight.normal),
                    selectedColor: Colors.greenAccent,
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
                      color: Colors.blueGrey,
                      fontSize: 20, fontWeight: FontWeight.bold,
                    ),
                    leftChevronIcon: Icon(
                      Icons.chevron_left,
                      color: Colors.blueGrey,
                    ),
                    rightChevronIcon: Icon(
                      Icons.chevron_right,
                      color: Colors.blueGrey,
                    )
                ),
                calendarController: _controller,
                onDaySelected: (day, events, holidays) {
                  print("day actuelll $day");
                  day_calendar=day;
                  getDispo(widget.type, day);
                  setState(() {
                    getDispo(widget.type, day);
                  });
                  print("contrrrrrrrrrrrr ${_controller.isToday(day)}");

                } ,

              ),
              SizedBox(height: 20,),
              Container(

                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.55,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular((50)), topRight: Radius.circular(50)),

                    color:Colors.black12
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    child: FutureBuilder(
                      future: getDispo(widget.type, day_calendar),
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
                                color: Colors.blueGrey,
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
                                    ),
                              );
                            },
                          );
                        }
                        return CircularProgressIndicator();
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
}