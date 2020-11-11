import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import "package:flutter/cupertino.dart";

class Picker extends StatefulWidget {
  @override
  _PickerState createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  CalendarController _controller;
  TextStyle dayStyle(FontWeight fontWeight)
  {
    return TextStyle(color: Colors.blueGrey, fontWeight: fontWeight);
  }
  Container taskList(String title, String description, IconData iconImg, Color iconColor)
  {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        children: <Widget>[
          Icon(
            iconImg,
            color: iconColor,
            size: 30,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            width: MediaQuery.of(context).size.width*0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title,
                    style:
                    TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    )
                ),
                SizedBox(height: 10,),
                Text(
                    description, style:TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal
                )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  @override
  void initState()
  {
    super.initState();
    _controller = CalendarController();
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
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.only(left: 30),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular((50)), topRight: Radius.circular(50)),

                    color:Colors.blueGrey
                ),
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 50),
                          child: Text("Today", style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),
                          ),
                        ),
                        taskList("08:00 - 09:00", "Disponible", CupertinoIcons.check_mark_circled_solid, Color(0xff00cf8d)),
                        taskList("09:00 - 10:00 ", "Reservé", CupertinoIcons.clock_solid, Color(0xffff9e00)),
                        taskList("10:00 - 11:00", "Reservé", CupertinoIcons.clock_solid, Color(0xffff9e00)),
                        taskList("11:00 - 12:00", "Disponible", CupertinoIcons.check_mark_circled_solid, Color(0xff00cf8d))
                      ],
                    ),
                    Positioned(
                      bottom: 0,
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: FractionalOffset.topCenter,
                                end: FractionalOffset.bottomCenter,
                                colors: [
                                  Color(0xff30384c).withOpacity(0),
                                  Color(0xff30384c)
                                ],
                                stops: [
                                  0.0,
                                  1.0
                                ]
                            )
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      right: 20,
                      child: Container(
                        padding: EdgeInsets.all((20)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color:Colors.blueAccent,
                            boxShadow: [BoxShadow(
                                color: Colors.black38,
                                blurRadius: 30
                            )]
                        ),
                        child: Text("+", style: TextStyle(color: Colors.white, fontSize: 40),),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}