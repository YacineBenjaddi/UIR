import 'package:LoisirProj/model/Loisir.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'controller/utilities/ApiUrl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class LoisirPage extends StatefulWidget {
  final String id_loisir;

  LoisirPage({this.id_loisir});

  @override
  _LoisirPage createState() => _LoisirPage();
}

class _LoisirPage extends State<LoisirPage> {
  var id_loisir,nom,description,latitude,longitude;

  @override
  void initState(){
    id_loisir=widget.id_loisir;
    nom="";
    description="";
    latitude="";
    longitude="";
    _getOneLoisir();

  }

  Future<List<Loisir>> _getOneLoisir() async {
    var msg = "";
    print("getOneLoisir $id_loisir");
    final response = await http.post(ApiUrl.getLoisir, body: {
      "id_loisir": id_loisir,
    });
    var dataloisir = json.decode(response.body);



    if (dataloisir.length == 0) {
      setState(() {
        msg = "loisir not found";
      });
    }

    if (dataloisir.length > 0) {
      setState(() {
        print(dataloisir);
        id_loisir = dataloisir[0]['id_loisir'];
        nom = dataloisir[0]['nom'];
        description = dataloisir[0]['description'];
        latitude = dataloisir[0]['latitude'];
        longitude = dataloisir[0]['longitude'];
      });
    }
    return dataloisir;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text '),
      ),
      body: Center(
        child: MaterialButton(
          color: Colors.purple,
          child: Text('$nom and $description and $longitude and $latitude'),
        ),
      ),
    );
  }

  void showToast(String msg, {int duration, int gravity}){
    Toast.show(msg, context,duration: duration,gravity: gravity);
  }
}

