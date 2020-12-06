
import 'dart:convert';

import 'package:LoisirProj/model/User.dart';
import 'package:LoisirProj/model/horaire.dart';
import 'package:LoisirProj/view/Picker.dart';

import 'package:http/http.dart' as http;

import 'package:jiffy/jiffy.dart';
import 'ApiUrl.dart';
import 'package:intl/intl.dart';


class Services {


List imgList = [];
  static List<User> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }





  static Future<String> login(String email,String password) async {

      final response = await http.post(ApiUrl.login, body: {
        "email": email,
        "password":password,
      });

      var datauser = json.decode(response.body);


      if (datauser.length == 0) {
         return 'error';
        }

      if (datauser[0]['profile'] == 'User' || datauser[0]['profile'] == 'Personnel') {
        if (int.parse(datauser[0]['penalty'] ) < 3 ) {
          print("Innnnnnnnnnnnnnnnnnnnnnnnnnnnnnn ");
          return 'success';
        }else{
          return 'error';

        }
      }else{
        return 'error';
      }

      }


  static Future<String> get_nbBlock_DateFin(String email) async {


    final response = await http.post(ApiUrl.getOne, body: {
      "email": email,
    });

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      return null;
    }

    if (datauser.length > 0) {
      print('qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq#3#####3 ${response.body}');
    return response.body;

    }
  }

  static Future<String> check(String email) async {

    final response = await http.post(ApiUrl.check, body: {
      "email": email,
    });

    var datauser = json.decode(response.body);


    if (datauser[0]['password'] != '') {
      return 'error';
    }

    if (datauser[0]['password'] == '') {
      print('cheeeeeeeeeeeeeeeeeeeeeeeck  ${response.body}');
      return 'success';

    }
  }

  static Future<String> UpdatePassword(String email,String password)async {

    final response = await http
        .post(ApiUrl.addpassword, body: {"email": email, "password": password});

    var data = json.decode(response.body);

    int value = data['value'];
    print("Value is : $value");
    if (value == 1) {
     return 'success';
    }else{
      return 'error';
    }
  }

  static Future<String> checkEmail(String email)async {

    final response = await http
        .post(ApiUrl.submit, body: {"email": email});

    var data = json.decode(response.body);

    int value = data['value'];
    print("Value is : $value");
    if (value == 1) {
      return 'success';
    }else{
      return 'error';
    }
  }

  static Future<String> ValidateCode(String email,String code)async {

    final response = await http
        .post(ApiUrl.validate, body: {"email": email,"reset" : code});

    var data = json.decode(response.body);

    int value = data['value'];
    print("Value is : $value");
    if (value == 1) {
      return 'success';
    }else{
      return 'error';
    }
  }

  static Future<String> UpdatePass(String email,String password)async {

    final response = await http
        .post(ApiUrl.addpassword, body: {"email": email,"password" : password});

    var data = json.decode(response.body);

    int value = data['value'];
    print("Value is : $value");
    if (value == 1) {
      return 'success';
    }else{
      return 'error';
    }
  }


  static Future<String> CheckPassword(String email,String password) async {

    final response = await http
        .post(ApiUrl.login, body: {"email": email,"password" : password});
    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      return 'error';
      }
    else{
      return 'success';
    }
    }

  static Future<String> getOneLoisir(String id_loisir) async {

    print("getOneLoisir $id_loisir");
    final response = await http.post(ApiUrl.getLoisir, body: {
      "id_loisir": id_loisir,
    });

      return response.body;


  }


static Future<String> getPhotos(String id_loisir) async {

  final response = await http.post(ApiUrl.getPhotosTerrains, body: {
    "id_loisir": id_loisir,
  });

  var dataPhoto = json.decode(response.body);
  if (dataPhoto.length == 0) {
    return 'error';
  }
  else {
    return response.body;
  }
}


static Future<String> getAllLoisirs() async {

  final response = await http.post(ApiUrl.getAllLoisir);

  var datauser = json.decode(response.body);
  if (datauser.length == 0) {
    return 'error';
  }
  else {
    return response.body;
  }
}

static Future<List<horaire>> getDispoPiscine(String type, DateTime d,String gender,String profile,String capacite) async {

  final DateTime now = DateTime.now();
  var hour,hour_max,hour_not,day_calendar;
  String da="${d}".split(' ')[0];
  day_nam= DateFormat('EEEE').format(d);
  var hour_now;

  if (now.isAtSameMomentAs(d)) {
    hour_now = "${now.hour}";
  }
  else if (d.isAfter(now)) {
    hour_now = "7";
  } else {
    return null;
  }

  if(Jiffy(d).week%2==0){
    switch(day_nam) {
      case 'Monday': {
        // statements;
        if(gender=='male'){
          if(profile=="User"){
            hour= "14";
            hour_not="18";
            hour_max="21";
          }else{
            hour= "18";
            hour_max="19";
            hour_not="0";

          }
        }
        else{
          if(profile=="User"){
            hour= "8";
            hour_max="13";
            hour_not="24";
          }else{
            hour= "13";
            hour_max="14";
            hour_not="24";
          }
        }
      }
      break;

      case 'Tuesday': {
        //statements;
        if(gender=='male'){
          if(profile=="User"){
            hour= "8";
            hour_max="13";
            hour_not="24";
          }else{
            hour= "24";
            hour_max="24";
            hour_not="24";
          }
        }
        else{
          if(profile=="User"){
            hour= "8";
            hour_max="21";
            hour_not="24";
          }else{
            hour= "24";
            hour_max="24";
            hour_not="24";
          }
        }
      }
      break;
      case 'Wednesday': {
        //statements;
        if(gender=='male'){
          if(profile=="User"){
            hour= "8";
            hour_max="21";
            hour_not="18";
          }else{
            hour= "18";
            hour_max="19";
            hour_not="24";
          }
        }
        else{
          if(profile=="User"){
            hour= "14";
            hour_max="21";
            hour_not="18";
          }else{
            hour= "13";
            hour_max="14";
            hour_not="24";
          }
        }
      }
      break;
      case 'Thursday': {
        //statements;
        if(gender=='male'){
          if(profile=="User"){
            hour= "8";
            hour_max="13";
            hour_not="24";
          }else{
            hour= "24";
            hour_max="24";
            hour_not="24";
          }
        }
        else{
          if(profile=="User"){
            hour= "13";
            hour_max="21";
            hour_not="24";
          }else{
            hour= "24";
            hour_max="24";
            hour_not="24";
          }
        }
      }
      break;
      case 'Friday': {
        //statements;
        if(gender=='male'){
          if(profile=="User"){
            hour= "14";
            hour_max="21";
            hour_not="18";
          }else{
            hour= "18";
            hour_max="19";
            hour_not="24";
          }
        }
        else{
          if(profile=="User"){
            hour= "8";
            hour_max="13";
            hour_not="24";
          }else{
            hour= "13";
            hour_max="14";
            hour_not="24";
          }
        }
      }
      break;
      case 'Saturday': {
        //statements;
        if(gender=='male'){
          if(profile=="User"){
            hour= "8";
            hour_max="13";
            hour_not="24";
          }else{
            hour= "24";
            hour_max="24";
            hour_not="24";
          }
        }
        else{
          if(profile=="User"){
            hour= "13";
            hour_max="21";
            hour_not="24";
          }else{
            hour= "24";
            hour_max="24";
            hour_not="24";
          }
        }
      }
      break;
      case 'Sunday': {
        //statements;
        if(gender=='male'){
          if(profile=="User"){
            hour= "8";
            hour_max="14";
            hour_not="0";
          }else{
            hour= "24";
            hour_max="24";
            hour_not="0";
          }
        }
        else{
          if(profile=="User"){
            hour= "14";
            hour_max="21";
            hour_not="0";
          }else{
            hour= "24";
            hour_max="24";
            hour_not="0";
          }
        }
      }
      break;
      default: {
        //statements;
        print("its not monday or tuesday");
      }
      break;
    }//calenad week pair
  }else{
    switch(day_nam) {
      case "Monday": {
        // statements;
        if(gender=='male'){
          if(profile=="User"){
            hour= "8";
            hour_max="13";
            hour_not="0";
          }else{
            hour= "13";
            hour_max="14";
            hour_not="0";
          }
        }
        else{
          if(profile=="User"){
            hour= "14";
            hour_max="21";
            hour_not="18";
          }else{
            hour= "18";
            hour_max="19";
            hour_not="0";
          }
        }
      }
      break;

      case "Tuesday": {
        //statements;
        if(gender=='male'){
          if(profile=="User"){
            hour= "8";
            hour_max="21";
            hour_not="0";
          }else{
            hour= "24";
            hour_max="24";
            hour_not="0";
          }
        }
        else{
          if(profile=="User"){
            hour= "8";
            hour_max="13";
            hour_not="0";
          }else{
            hour= "24";
            hour_max="24";
            hour_not="0";
          }
        }
      }
      break;
      case "Wednesday": {
        //statements;
        if(gender=='male'){
          if(profile=="User"){
            hour= "14";
            hour_max="21";
            hour_not="18";
          }else{
            hour= "13";
            hour_max="14";
            hour_not="0";
          }
        }
        else{
          if(profile=="User"){
            hour= "8";
            hour_max="13";
            hour_not="24";
          }else{
            hour= "18";
            hour_max="19";
            hour_not="24";
          }
        }
      }
      break;
      case "Thursday": {
        //statements;
        if(gender=='male'){
          if(profile=="User"){
            hour= "13";
            hour_max="21";
            hour_not="0";
          }else{
            hour= "24";
            hour_max="24";
            hour_not="0";
          }
        }
        else{
          if(profile=="User"){
            hour= "8";
            hour_max="13";
            hour_not="0";
          }else{
            hour= "24";
            hour_max="24";
            hour_not="0";
          }
        }
      }
      break;
      case "Friday": {
        //statements;
        if(gender=='male'){
          if(profile=="User"){
            hour= "8";
            hour_max="13";
            hour_not="0";
          }else{
            hour= "13";
            hour_max="14";
            hour_not="0";
          }
        }
        else{
          if(profile=="User"){
            hour= "14";
            hour_max="21";
            hour_not="18";
          }else{
            hour= "18";
            hour_max="19";
            hour_not="0";
          }
        }
      }
      break;
      case "Saturday": {
        //statements;
        if(gender=='male'){
          if(profile=="User"){
            hour= "13";
            hour_max="21";
            hour_not="0";
          }else{
            hour= "24";
            hour_max="24";
            hour_not="0";
          }
        }
        else{
          if(profile=="User"){
            hour= "8";
            hour_max="13";
            hour_not="0";
          }else{
            hour= "24";
            hour_max="24";
            hour_not="0";
          }
        }
      }
      break;
      case 'Sunday': {
        //statements;
        if(gender=='male'){
          if(profile=="User"){
            hour= "14";
            hour_max="21";
            hour_not="24";
          }else{
            hour= "24";
            hour_max="24";
            hour_not="24";
          }
        }
        else{
          if(profile=="User"){
            hour= "8";
            hour_max="14";
            hour_not="24";
          }else{
            hour= "24";
            hour_max="24";
            hour_not="24";
          }
        }
      }
      break;

      default: {
        //statements;
        print("its not monday or tuesday");
      }
      break;
    }
    //calendar week impair
  }
  final response = await http.post(ApiUrl.getDispoTerrain, body: {"hour": hour,"hour_max":hour_max,
    "hour_not":hour_not,"hour_now":hour_now,"date_res":da,"type":type,"capacite":capacite,
  });
  print("response Pisonceee ${response.body} daaaaaate $da");
  return  horaireFromJson(response.body);
}

static Future<String> getOneProfile(String email) async {


  final response = await http.post(ApiUrl.getOne, body: {
    "email": email,
  });

  var datauser = json.decode(response.body);

  if (datauser.length == 0) {
    return null;
  }

  if (datauser.length > 0) {

    return response.body;

  }
}


  static Future<String> fetchreservation(String id_user) async {
  final response = await http.post(ApiUrl.getRes, body: {
    "id_user": id_user,
  });
  var datauser = json.decode(response.body);
  if (datauser.length == 0) {
    print("errrrrrrrrrrrrrrrrrrrrrororor 444");
    return null;

  }
  if (datauser.length > 0) {

    return response.body;
  }

}

  static Future<String> RemoveReservation(String id,String type) async {
  // print("$id");
  final response = await http.post(ApiUrl.removeRes, body: {
    "id_res": id,"type":type,
  });

  var datauser = json.decode(response.body);
  if (datauser.length == 0) {
    return null;
  }
  if (datauser.length > 0) {
    return response.body;
  }

}

  static Future<String> addReservation(String da,String cre,DateTime d,String type, String id,String capacite) async{

  final response = await http.post(ApiUrl.addRes, body: {"date": da,"id_horaire":cre,"id_user":id,"type":type,"capacite":capacite
  });
  var datauser = json.decode(response.body);
  if (datauser.length == 0) {
    return null;
  }
  if (datauser.length > 0) {
    return response.body;
  }
}


}
