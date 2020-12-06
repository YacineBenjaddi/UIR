import 'dart:convert';
import 'package:LoisirProj/controller/utilities/Services.dart';
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

import 'homepage.dart';
var day_calendar,day_nam,gender,profile,id_user,email;
class Picker extends StatefulWidget {
  String type,capacite;
  Picker({this.type,this.capacite});
  @override
  _PickerState createState() => _PickerState();

}

Future<List<horaire>> getDispo(String type, DateTime d,String capacite) async {

  var result= await Services.getDispoPiscine(type, day_calendar, gender, profile,capacite);


  if (type == "piscine") {

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
 if(type == "musc") {
   final response = await http.post(ApiUrl.getDispoTerrain, body: {"hour":"18","hour_max":"24",
     "hour_not":"24","hour_now":hour,"date_res":da,"type":type,"capacite":capacite,
   });

   return horaireFromJson(response.body);
  }else{
    final response = await http.post(ApiUrl.getDispoTerrain, body: {"hour": hour,"hour_max":"24",
      "hour_not":"24","hour_now":hour,"date_res":da,"type":type,"capacite":capacite,
    });

    return horaireFromJson(response.body);
  }}
}


// Future<List<horaire>> getDispoPiscine(String type, DateTime d,String gender,String profile) async {
//
//   final DateTime now = DateTime.now();
//   var hour,hour_max,hour_not;
//   String da="${day_calendar}".split(' ')[0];
//   day_nam= DateFormat('EEEE').format(d);
//   var hour_now;
//
//   if (now.isAtSameMomentAs(d)) {
//     hour_now = "${now.hour}";
//   }
//   else if (d.isAfter(now)) {
//     hour_now = "7";
//   } else {
//     return null;
//   }
//
// if(Jiffy(d).week%2==0){
//   switch(day_nam) {
//     case 'Monday': {
//       // statements;
//       if(gender=='male'){
//         if(profile=="User"){
//           hour= "14";
//           hour_not="18";
//           hour_max="21";
//         }else{
//           hour= "18";
//           hour_max="19";
//           hour_not="0";
//
//         }
//       }
//       else{
//         if(profile=="User"){
//           hour= "8";
//           hour_max="13";
//           hour_not="24";
//         }else{
//           hour= "13";
//           hour_max="14";
//           hour_not="24";
//         }
//       }
//     }
//     break;
//
//     case 'Tuesday': {
//       //statements;
//       if(gender=='male'){
//         if(profile=="User"){
//           hour= "8";
//           hour_max="13";
//           hour_not="24";
//         }else{
//           hour= "24";
//           hour_max="24";
//           hour_not="24";
//         }
//       }
//       else{
//         if(profile=="User"){
//           hour= "8";
//           hour_max="21";
//           hour_not="24";
//         }else{
//           hour= "24";
//           hour_max="24";
//           hour_not="24";
//         }
//       }
//     }
//     break;
//     case 'Wednesday': {
//       //statements;
//       if(gender=='male'){
//         if(profile=="User"){
//           hour= "8";
//           hour_max="21";
//           hour_not="18";
//         }else{
//           hour= "18";
//           hour_max="19";
//           hour_not="24";
//         }
//       }
//       else{
//         if(profile=="User"){
//           hour= "14";
//           hour_max="21";
//           hour_not="18";
//         }else{
//           hour= "13";
//           hour_max="14";
//           hour_not="24";
//         }
//       }
//     }
//     break;
//     case 'Thursday': {
//       //statements;
//       if(gender=='male'){
//         if(profile=="User"){
//           hour= "8";
//           hour_max="13";
//           hour_not="24";
//         }else{
//           hour= "24";
//           hour_max="24";
//           hour_not="24";
//         }
//       }
//       else{
//         if(profile=="User"){
//           hour= "13";
//           hour_max="21";
//           hour_not="24";
//         }else{
//           hour= "24";
//           hour_max="24";
//           hour_not="24";
//         }
//       }
//     }
//     break;
//     case 'Friday': {
//       //statements;
//       if(gender=='male'){
//         if(profile=="User"){
//           hour= "14";
//           hour_max="21";
//           hour_not="18";
//         }else{
//           hour= "18";
//           hour_max="19";
//           hour_not="24";
//         }
//       }
//       else{
//         if(profile=="User"){
//           hour= "8";
//           hour_max="13";
//           hour_not="24";
//         }else{
//           hour= "13";
//           hour_max="14";
//           hour_not="24";
//         }
//       }
//     }
//     break;
//     case 'Saturday': {
//       //statements;
//       if(gender=='male'){
//         if(profile=="User"){
//           hour= "8";
//           hour_max="13";
//           hour_not="24";
//         }else{
//           hour= "24";
//           hour_max="24";
//           hour_not="24";
//         }
//       }
//       else{
//         if(profile=="User"){
//           hour= "13";
//           hour_max="21";
//           hour_not="24";
//         }else{
//           hour= "24";
//           hour_max="24";
//           hour_not="24";
//         }
//       }
//     }
//     break;
//     case 'Sunday': {
//       //statements;
//       if(gender=='male'){
//         if(profile=="User"){
//           hour= "8";
//           hour_max="14";
//           hour_not="0";
//         }else{
//           hour= "24";
//           hour_max="24";
//           hour_not="0";
//         }
//       }
//       else{
//         if(profile=="User"){
//           hour= "14";
//           hour_max="21";
//           hour_not="0";
//         }else{
//           hour= "24";
//           hour_max="24";
//           hour_not="0";
//         }
//       }
//     }
//     break;
//     default: {
//       //statements;
//       print("its not monday or tuesday");
//     }
//     break;
//   }//calenad week pair
// }else{
//   switch(day_nam) {
//     case "Monday": {
//       // statements;
//       if(gender=='male'){
//         if(profile=="User"){
//           hour= "8";
//           hour_max="13";
//           hour_not="0";
//         }else{
//           hour= "13";
//           hour_max="14";
//           hour_not="0";
//         }
//       }
//       else{
//         if(profile=="User"){
//           hour= "14";
//           hour_max="21";
//           hour_not="18";
//         }else{
//           hour= "18";
//           hour_max="19";
//           hour_not="0";
//         }
//       }
//     }
//     break;
//
//     case "Tuesday": {
//       //statements;
//       if(gender=='male'){
//         if(profile=="User"){
//           hour= "8";
//           hour_max="21";
//           hour_not="0";
//         }else{
//           hour= "24";
//           hour_max="24";
//           hour_not="0";
//         }
//       }
//       else{
//         if(profile=="User"){
//           hour= "8";
//           hour_max="13";
//           hour_not="0";
//         }else{
//           hour= "24";
//           hour_max="24";
//           hour_not="0";
//         }
//       }
//     }
//     break;
//     case "Wednesday": {
//       //statements;
//       if(gender=='male'){
//         if(profile=="User"){
//           hour= "14";
//           hour_max="21";
//           hour_not="18";
//         }else{
//           hour= "13";
//           hour_max="14";
//           hour_not="0";
//         }
//       }
//       else{
//         if(profile=="User"){
//           hour= "8";
//           hour_max="13";
//           hour_not="24";
//         }else{
//           hour= "18";
//           hour_max="19";
//           hour_not="24";
//         }
//       }
//     }
//     break;
//     case "Thursday": {
//       //statements;
//       if(gender=='male'){
//         if(profile=="User"){
//           hour= "13";
//           hour_max="21";
//           hour_not="0";
//         }else{
//           hour= "24";
//           hour_max="24";
//           hour_not="0";
//         }
//       }
//       else{
//         if(profile=="User"){
//           hour= "8";
//           hour_max="13";
//           hour_not="0";
//         }else{
//           hour= "24";
//           hour_max="24";
//           hour_not="0";
//         }
//       }
//     }
//     break;
//     case "Friday": {
//       //statements;
//       if(gender=='male'){
//         if(profile=="User"){
//           hour= "8";
//           hour_max="13";
//           hour_not="0";
//         }else{
//           hour= "13";
//           hour_max="14";
//           hour_not="0";
//         }
//       }
//       else{
//         if(profile=="User"){
//           hour= "14";
//           hour_max="21";
//           hour_not="18";
//         }else{
//           hour= "18";
//           hour_max="19";
//           hour_not="0";
//         }
//       }
//     }
//     break;
//     case "Saturday": {
//       //statements;
//       if(gender=='male'){
//         if(profile=="User"){
//           hour= "13";
//           hour_max="21";
//           hour_not="0";
//         }else{
//           hour= "24";
//           hour_max="24";
//           hour_not="0";
//         }
//       }
//       else{
//         if(profile=="User"){
//           hour= "8";
//           hour_max="13";
//           hour_not="0";
//         }else{
//           hour= "24";
//           hour_max="24";
//           hour_not="0";
//         }
//       }
//     }
//     break;
//     case 'Sunday': {
//       //statements;
//       if(gender=='male'){
//         if(profile=="User"){
//           hour= "14";
//           hour_max="21";
//           hour_not="24";
//         }else{
//           hour= "24";
//           hour_max="24";
//           hour_not="24";
//         }
//       }
//       else{
//         if(profile=="User"){
//           hour= "8";
//           hour_max="14";
//           hour_not="24";
//         }else{
//           hour= "24";
//           hour_max="24";
//           hour_not="24";
//         }
//       }
//     }
//     break;
//
//     default: {
//       //statements;
//       print("its not monday or tuesday");
//     }
//     break;
//   }
//   //calendar week impair
// }
//   final response = await http.post(ApiUrl.getDispoPiscine, body: {"hour": hour,"hour_max":hour_max,"hour_not":hour_not,"hour_now":hour_now,
//   });
// print("response Pisonceee ${response.body}");
//   return horaireFromJson(response.body);
// }



class _PickerState extends State<Picker> {

  /*Future<String> addReservation(String cre,DateTime d,String type, String id) async{
    String da = "${d}".split(' ')[0];
    final response = await http.post(ApiUrl.addRes, body: {"date": da,"id_horaire":cre,"id_user":id,"type":type,"capacite":widget.capacite
    });
    print("response Pisonceee ${response.body}");
var data=jsonDecode(response.body);
print(data.toString());
      return data.toString();
  }*/

  Future<String> addReservation(String cre,DateTime d,String type, String id) async{
    String da = "${d}".split(' ')[0];
    final result = await Services.addReservation(da,cre, d, type, id, widget.capacite);
    print("response Pisonceee ${result}");
    var data=jsonDecode(result);
    print("wwwwwwwwwwwwwwwwwwwwww ${data.toString()}");
    return data.toString();
  }


  int PopUp_Confirmer(String cre,DateTime d,String type, String id) {
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
                onPressed: (){
                  Navigator.of(context).pop();
                 // String test;
                   addReservation(cre,d,type,id).then((result) {
                  if (result=='success') {
                    Navigator.pushReplacement(
                        context, new MaterialPageRoute(builder: (context) => homepage(email)));
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
  void initState() {
    // TODO: implement initState
    super.initState();
    getDispo(widget.type,day_calendar,widget.capacite);

     Services.getDispoPiscine(widget.type, day_calendar, gender, profile,widget.capacite);

   // getDispoPiscine(widget.type,day_calendar, gender, profile);
    _controller = CalendarController();
    initial();
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
        color: Colors.black,

        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30,),

              TableCalendar(


                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarStyle: CalendarStyle(
                    weekdayStyle: dayStyle(FontWeight.normal),
                    weekendStyle: dayStyle(FontWeight.normal),
                    selectedColor: Colors.green,
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

                  day_calendar=day;
                  setState(() {

                      getDispo(widget.type, day,widget.capacite);


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

                    color:Colors.black
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    child: FutureBuilder(
                      future: getDispo(widget.type, day_calendar,widget.capacite),
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
                                      PopUp_Confirmer(basket.id_horaire,day_calendar,widget.type,id_user);
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
}